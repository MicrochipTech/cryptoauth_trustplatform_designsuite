import base64
import binascii
import os
import os.path
import cryptography

from cryptography import x509
from cryptography.hazmat.primitives import serialization, hashes
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.asymmetric import ec, utils
from cryptoauthlib import *
from mchpcert_bckp_restore import isMCHP_cert, mchp_cert_bckp
from public_key_rotation_helper import *

from certs_handler import *
from trustplatform import *


# Setup cryptography
crypto_be = cryptography.hazmat.backends.default_backend()

tflexSlotType = {
    0: "private",    1: "private",    2: "private",    3: "private",
    4: "private",    5: "secret",     6: "secret",     7: "sboot_dig",
    8: "reserved",   9: "secret",     10: "cert",      11: "cert",
    12: "cert",      13: "public",    14: "public",    15: "public"
}

slotsize = {
    0: 32,    1: 32,    2: 32,    3: 32,
    4: 32,    5: 32,    6: 32,    7: 32,
    8: 416,   9: 64,    10: 64,   11: 64,
    12: 64,   13: 64,   14: 64,   15: 64
}

# General Cryptoauthlib Macros
LOCK_ZONE_CONFIG = 0x00
LOCK_ZONE_DATA = 0x01
LOCK_ZONE_NO_CRC = 0x80
LOCK_ZONE_CONFIG = 0x00
ATCA_ZONE_CONFIG = 0x00
ATCA_ZONE_DATA = 0x02

resource_dir = "../resources/"

def create_resources_for_c_examples():
    application_bin = 'secureboot_test_app.bin'
    application_h = 'secureboot_test_app.h'
    app_signature_bin = 'secureboot_test_app_sign.bin'
    app_signature_h = 'secureboot_test_app_sign.h'
    with open(application_bin, 'rb') as f:
        app_image = f.read()

    with open(application_h, 'w') as f:
        f.write('uint8_t secureboot_test_app[] = {\n')
        f.write(str(common_helper.convert_to_hex_bytes(app_image)))
        f.write('};')

    BLOCKSIZE = 65536
    # Hashing the Application binary file bin_file
    chosen_hash = hashes.SHA256()
    hasher = hashes.Hash(chosen_hash, crypto_be)
    app_file = open(application_bin, "rb")
    buf = app_file.read(BLOCKSIZE)
    while len(buf) > 0:
        hasher.update(buf)
        buf = app_file.read(BLOCKSIZE)
    app_file.close()
    digest = hasher.finalize()

    key_file = 'slot_15_ecc_key_pair.pem'
    with open(key_file, 'rb') as f:
        # Loading the private key from key_file
        private_key = serialization.load_pem_private_key(
            data=f.read(),
            password=None,
            backend=crypto_be)

    # Signing the digest of the Application binary file bin_file
    sign = private_key.sign(
            digest,
            ec.ECDSA(utils.Prehashed(chosen_hash))
    )
    # Extract actual Signature bytes
    r_offset = (sign[3]-32)+4
    sign_r = sign[r_offset:r_offset+32]
    s_offset = (sign[r_offset+32+1]-32)+(r_offset+32+2)
    sign_s = sign[s_offset:s_offset+32]

    with open(app_signature_bin, 'wb') as f:
        f.write(sign_r)
        f.write(sign_s)

    with open(app_signature_h, 'w') as f:
        f.write('uint8_t secureboot_test_app_sign[] = {\n')
        f.write(str(common_helper.convert_to_hex_bytes(sign_r) + common_helper.convert_to_hex_bytes(sign_s)))
        f.write('};')

def create_resource_and_program(slot_number):
    """
    Creates resource for a slot according to its type then programs it
    """
    # Get slot type from dict
    slot_type = tflexSlotType[slot_number]
    # Get slot size from dict
    slot_size = int(slotsize[slot_number])

    # Configure and create data according to slot type
    if (slot_type == "private"):
        print("Slot", slot_number, "is a private key slot, no action required")
        #print("Tflex devices ship with generated private keys in respective slots")
    elif (slot_type == "secret") or (slot_type == "general"):
        # Generate data
        new_key_bytes = bytearray(slot_size)
        new_key_bytes = os.urandom(slot_size)
        # Generate the .pem file
        if (slot_type == "secret"):
            addstr = "_secret_key"
        elif (slot_type == "general"):
            addstr = "_general_data"
        key_file_name = "slot_" + str(slot_number) + addstr + ".pem"

        if (slot_number != 5):
            assert atcab_write_bytes_zone(ATCA_ZONE_DATA, slot_number, 0, new_key_bytes, slot_size) == Status.ATCA_SUCCESS
        elif (slot_number == 5):
            with open("slot_6_secret_key.pem", 'rb') as f:
                pem_bytes = f.read()
            type_name, headers, io_key = pem.unarmor(pem_bytes)
            #print(binascii.hexlify(io_key[17: len(io_key)]))
            io_key = io_key[17: len(io_key)]
            assert atcab_write_enc(slot_number, 0, new_key_bytes, io_key, 6) == Status.ATCA_SUCCESS
            print('\nNOTE: While writing symmetric key into secure element it has to be encrypted with IO protection key. So here, Slot 6 (IO protection key) is written before slot 5 (Symmetric key) \n')

        with open(key_file_name.replace('.pem', '.h'), 'w') as f:
            f.write('uint8_t '+ 'slot_' + str(slot_number) + addstr + '[] = {\n')
            key_for_c = common_helper.convert_to_hex_bytes(new_key_bytes)
            f.write(str(key_for_c))
            f.write('};')
            f.close()

        with open(key_file_name, 'w') as f:
            f.write(common_helper.convert_symmetric_to_pem(new_key_bytes, slot_size))
            f.close()
        print("Slot", slot_number, "is a "+tflexSlotType[slot_number]+' key, created ' + key_file_name+' and programmed')
    elif (slot_type == "reserved"):
        print("Slot", slot_number, "is a general purpose slot of size 416 bytes, no action required")
    elif (slot_type == "sboot_dig"):
        print("Slot", slot_number, "is a secureboot digest slot, slot can only be written through secureboot command")
    elif (slot_type == "cert"):
        print("Slot", slot_number, "is a certificate slot, no action required now, will be updated as part of Generate Certificates")
    elif (slot_type == "public"):
        addstr = "_ecc_key_pair"
        key_file_name = "slot_" + str(slot_number) + addstr + ".pem"

        priv_key = ec.generate_private_key(ec.SECP256R1(), crypto_be)
        # Save private key to file
        with open(key_file_name, 'wb') as f:
            pem_key = priv_key.private_bytes(
                encoding=serialization.Encoding.PEM,
                format=serialization.PrivateFormat.PKCS8,
                encryption_algorithm=serialization.NoEncryption())
            f.write(pem_key)
            f.close()

        with open(key_file_name, 'rb') as f:
            # Load the public key from key file
            priv_key = serialization.load_pem_private_key(
                        data=f.read(),
                        password=None,
                        backend=default_backend())
            public_key = priv_key.public_key().public_numbers().encode_point()[1:]

        if (slot_number == 14):
            public_key_check_validate()

        public_key_slot_data = bytearray(4) + public_key[0:32] + bytearray(4) + public_key[32:64]

        #write secure boot public key to crypto device
        assert atcab_write_bytes_zone(ATCA_ZONE_DATA, slot_number, 0, public_key_slot_data, 72) == Status.ATCA_SUCCESS
        print("Slot", slot_number, "is a "+tflexSlotType[slot_number]+' key slot, created ' + key_file_name+' and programmed')

    else:
        raise ValueError("Undefined slot type")

    return True


def mchp_cert():
    """
    Function check the if device contains MCHP certificate or not.
    If MCHP cert, it will validate the cert chain and print it.
    If MCHP cert not found, then it will check backup cert in the filesystem and
    it will provision into device
    """
    mchp_cert_info = isMCHP_cert()
    if mchp_cert_info['status'] == Status.ATCA_SUCCESS:
        status = certs_handler.validate_and_print_certificate_chain(mchp_cert_info['root_cert'],
                                mchp_cert_info['signer_cert'], mchp_cert_info['device_cert'])
    else:
        status = mchp_cert_bckp(mchp_cert_info)

    if status == Status.ATCA_SUCCESS:
        return 'success'
    else:
        return 'danger'

def custom_cert(org_name):
    """
    Function takes MCHP certificates backup if it found in device and
    generate custom certificate and provision to device
    """
    mchp_cert_info = isMCHP_cert()
    if mchp_cert_info['status'] == Status.ATCA_SUCCESS:
        status = mchp_cert_bckp(mchp_cert_info)

    #org_name = "{:<24}".format(org_name[:24]).replace(" ", "_")
    #print('Adjusted Orgname for size and spaces:' + org_name)
    #assert len(org_name) < 25, "Org name can be maximum of 24 characters"

    root_key_path = Path('root_key.key')
    root_pub_key_path = Path('root_pub_key.pem')
    root_cert_path = Path('root_crt.crt')
    signer_id = 'FFFF'
    signer_key_path = Path('signer_'+signer_id+'.key')
    signer_cert_path = Path('signer_'+signer_id+'.crt')
    device_cert_path = Path('device_template.crt')

    certs_handler.set_root_user_data(org_name)
    certs_handler.set_signer_user_data(org_name)
    certs_handler.set_device_user_data(org_name)
    certs_handler.create_trust_chain(root_key_path, root_cert_path, signer_id, signer_key_path, signer_cert_path, device_cert_path)
    signer_cert_def, device_cert_def = certs_handler.generate_cert_def_files(root_cert_path, signer_id, signer_cert_path, device_cert_path)

    with open(root_pub_key_path, 'w') as f:
        f.write(common_helper.convert_ec_pub_to_pem(certs_handler.get_public_key(root_key_path)))
        f.close()

    print('Read device serial number...', end='')
    serial_num = bytearray(9)
    assert Status.ATCA_SUCCESS == atcab_read_serial_number(serial_num)
    print('OK (SN: {})'.format(serial_num.hex().upper()))

    print('Read device public key from slot {}...'.format(device_cert_def.private_key_slot), end='')
    public_key = bytearray(64)
    assert Status.ATCA_SUCCESS == atcab_get_pubkey(device_cert_def.private_key_slot, public_key)
    print('OK (Public Key: {})'.format(public_key.hex().upper()))

    print('Generating device certificate...'.format(device_cert_def.private_key_slot), end='')
    device_cert_path = Path('device_{}.crt'.format(base64.b16encode(serial_num).decode('ascii')))
    device_cert = certs_handler.build_device_cert(serial_num, public_key, signer_key_path, signer_cert_path, device_cert_path)
    print('OK (saved to {})'.format(device_cert_path))

    print('Saving signer certificate to device...', end='')
    signer_cert_der = read_cert(signer_cert_path).public_bytes(encoding=Encoding.DER)
    assert Status.ATCA_SUCCESS == atcacert_write_cert(signer_cert_def, signer_cert_der, len(signer_cert_der))
    print('OK')

    print('Saving device certificate to device...', end='')
    device_cert_der = device_cert.public_bytes(encoding=Encoding.DER)
    assert Status.ATCA_SUCCESS == atcacert_write_cert(device_cert_def, device_cert_der, len(device_cert_der))
    print('OK')

    for extension in device_cert.extensions:
        if extension.oid._name != 'subjectKeyIdentifier':
            continue # Not the extension we're looking for, skip
        thing_name = binascii.b2a_hex(extension.value.digest).decode('ascii')
    print('Thing ID {}'.format(thing_name))

    kit_info = certs_handler.read_kit_info()
    kit_info['thing_name'] = thing_name.lower()
    certs_handler.save_kit_info(kit_info)

    print('\n\r---------------------------------------------')
    print('Custom certificate generation and provisioning - SUCCESS')
    print('---------------------------------------------\n\r')

    # validate and print the certificate chain
    status = certs_handler.validate_and_print_certificate_chain(read_cert(root_cert_path),
                                read_cert(signer_cert_path), read_cert(device_cert_path))
    if status == Status.ATCA_SUCCESS:
        return 'success'
    else:
        return 'danger'
