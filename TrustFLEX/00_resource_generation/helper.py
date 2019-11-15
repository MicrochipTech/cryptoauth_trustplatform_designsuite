from common import *
import base64
import binascii
import os
import datetime
import os.path
import cryptography
import getpass
import pytz
import json

from ctypes import sizeof, create_string_buffer, memmove, addressof, c_uint8, POINTER
from cryptography import x509
from cryptography.hazmat.primitives import serialization, hashes
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.asymmetric import ec, utils
from cryptography.x509.oid import NameOID
from cryptoauthlib import *
from ca_create_root import ca_create_root
from ca_create_signer_csr import ca_create_signer_csr, add_signer_extensions
from ca_create_signer import ca_create_signer
from pyasn1_modules import pem
from manifest_generation_helper import tflxtls_custom_manifest, tflxtls_mchp_manifest
from mchpcert_bckp_restore import isTNG, mchp_cert_bckp
from public_key_rotation_helper import *
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
ATCA_SUCCESS = 0x00

resource_dir = "../resources/"

ATCACERT_DEF_DEVICE_CONFIG = {
    'type': atcacert_cert_type_t.CERTTYPE_X509,
    'template_id': 2,
    'chain_id': 0,
    'private_key_slot': 0,
    'sn_source': atcacert_cert_sn_src_t.SNSRC_PUB_KEY_HASH,
    'cert_sn_dev_loc': {
        'zone': atcacert_device_zone_t.DEVZONE_NONE,
        'slot': 0,
        'is_genkey': 0,
        'offset': 0,
        'count': 0
    },
    'issue_date_format': atcacert_date_format_t.DATEFMT_RFC5280_UTC,
    'expire_date_format': atcacert_date_format_t.DATEFMT_RFC5280_UTC,
    'tbs_cert_loc': {'offset': 4, 'count': 413},
    'expire_years': 10,
    'public_key_dev_loc': {
        'zone': atcacert_device_zone_t.DEVZONE_DATA,
        'slot': 0,
        'is_genkey': 1,
        'offset': 0,
        'count': 64
    },
    'comp_cert_dev_loc': {
        'zone': atcacert_device_zone_t.DEVZONE_DATA,
        'slot': 10,
        'is_genkey': 0,
        'offset': 0,
        'count': 72
    },
    'std_cert_elements' : [
        {'offset': 255, 'count': 64},
        {'offset': 429, 'count': 64},
        {'offset': 128, 'count': 13},
        {'offset': 143, 'count': 13},
        {'offset': 120, 'count': 4},
        {'offset': 15, 'count': 16},
        {'offset': 397, 'count': 20},
        {'offset': 364, 'count': 20},
    ]
}

cert_def_2_device_h = """
#ifndef CERT_DEF_2_DEVICE_H
#define CERT_DEF_2_DEVICE_H

#include "atcacert/atcacert_def.h"

extern const atcacert_def_t g_cert_def_2_device;

#endif
"""

cert_def_2_device_c_p1 = """
#include "atcacert/atcacert_def.h"

const uint8_t g_cert_template_2_device[] = {
"""

cert_def_2_device_c_p2 = """
};

const atcacert_cert_element_t g_cert_elements_2_device[] = {
    {
        .id = "SN03",
        .device_loc = {
            .zone = DEVZONE_CONFIG,
            .slot = 0,
            .is_genkey = 0,
            .offset = 0,
            .count = 4
        },
        .cert_loc = {
            .offset = 204,
            .count = 8
        },
        .transforms = {
            TF_BIN2HEX_UC,
            TF_NONE
        }
    },
    {
        .id = "SN48",
        .device_loc = {
            .zone = DEVZONE_CONFIG,
            .slot = 0,
            .is_genkey = 0,
            .offset = 8,
            .count = 5
        },
        .cert_loc = {
            .offset = 212,
            .count = 10
        },
        .transforms = {
            TF_BIN2HEX_UC,
            TF_NONE
        }
    }
};

const atcacert_def_t g_cert_def_2_device = {
    .type = CERTTYPE_X509,
    .template_id = 2,
    .chain_id = 0,
    .private_key_slot = 0,
    .sn_source = SNSRC_PUB_KEY_HASH,
    .cert_sn_dev_loc = {
        .zone = DEVZONE_NONE,
        .slot = 0,
        .is_genkey = 0,
        .offset = 0,
        .count = 0
    },
    .issue_date_format = DATEFMT_RFC5280_UTC,
    .expire_date_format = DATEFMT_RFC5280_UTC,
    .tbs_cert_loc = {
        .offset = 4,
        .count = 413
    },
    .expire_years = 10,
    .public_key_dev_loc = {
        .zone = DEVZONE_DATA,
        .slot = 0,
        .is_genkey = 1,
        .offset = 0,
        .count = 64
    },
    .comp_cert_dev_loc = {
        .zone = DEVZONE_DATA,
        .slot = 10,
        .is_genkey = 0,
        .offset = 0,
        .count = 72
    },
    .std_cert_elements = {
        { // STDCERT_PUBLIC_KEY
            .offset = 255,
            .count = 64
        },
        { // STDCERT_SIGNATURE
            .offset = 429,
            .count = 64
        },
        { // STDCERT_ISSUE_DATE
            .offset = 128,
            .count = 13
        },
        { // STDCERT_EXPIRE_DATE
            .offset = 143,
            .count = 13
        },
        { // STDCERT_SIGNER_ID
            .offset = 120,
            .count = 4
        },
        { // STDCERT_CERT_SN
            .offset = 15,
            .count = 16
        },
        { // STDCERT_AUTH_KEY_ID
            .offset = 397,
            .count = 20
        },
        { // STDCERT_SUBJ_KEY_ID
            .offset = 364,
            .count = 20
        }
    },
    .cert_elements = g_cert_elements_2_device,
    .cert_elements_count = sizeof(g_cert_elements_2_device) / sizeof(g_cert_elements_2_device[0]),
    .cert_template = g_cert_template_2_device,
    .cert_template_size = sizeof(g_cert_template_2_device)
};
"""

ATCACERT_DEF_SIGNER_CONFIG = {
    'type': atcacert_cert_type_t.CERTTYPE_X509,
    'template_id': 1,
    'chain_id': 0,
    'private_key_slot': 0,
    'sn_source': atcacert_cert_sn_src_t.SNSRC_PUB_KEY_HASH,
    'cert_sn_dev_loc': {
        'zone': atcacert_device_zone_t.DEVZONE_NONE,
        'slot': 0,
        'is_genkey': 0,
        'offset': 0,
        'count': 0
    },
    'issue_date_format': atcacert_date_format_t.DATEFMT_RFC5280_UTC,
    'expire_date_format': atcacert_date_format_t.DATEFMT_RFC5280_UTC,
    'tbs_cert_loc': {'offset': 4, 'count': 428},
    'expire_years': 10,
    'public_key_dev_loc': {
        'zone': atcacert_device_zone_t.DEVZONE_DATA,
        'slot': 11,
        'is_genkey': 0,
        'offset': 0,
        'count': 72
    },
    'comp_cert_dev_loc': {
        'zone': atcacert_device_zone_t.DEVZONE_DATA,
        'slot': 12,
        'is_genkey': 0,
        'offset': 0,
        'count': 72
    },
    'std_cert_elements' : [
        {'offset': 264, 'count': 64},
        {'offset': 444, 'count': 64},
        {'offset': 128, 'count': 13},
        {'offset': 143, 'count': 13},
        {'offset': 233, 'count': 4},
        {'offset': 15, 'count': 16},
        {'offset': 412, 'count': 20},
        {'offset': 379, 'count': 20},
    ]
}

cert_def_1_signer_h = """
#ifndef CERT_DEF_1_SIGNER_H
#define CERT_DEF_1_SIGNER_H

#include "atcacert/atcacert_def.h"

extern const uint8_t g_cert_ca_public_key_1_signer[];
extern const atcacert_def_t g_cert_def_1_signer;

#endif
"""

cert_def_1_signer_c_p1 = """
#include "atcacert/atcacert_def.h"

const uint8_t g_cert_template_1_signer[] = {
"""

cert_ca_public_key_1_signer = """
};

const uint8_t g_cert_ca_public_key_1_signer[] = {
"""

cert_def_1_signer_c_p2 = """
};

const atcacert_def_t g_cert_def_1_signer = {
    .type = CERTTYPE_X509,
    .template_id = 1,
    .chain_id = 0,
    .private_key_slot = 0,
    .sn_source = SNSRC_PUB_KEY_HASH,
    .cert_sn_dev_loc = {
        .zone = DEVZONE_NONE,
        .slot = 0,
        .is_genkey = 0,
        .offset = 0,
        .count = 0
    },
    .issue_date_format = DATEFMT_RFC5280_UTC,
    .expire_date_format = DATEFMT_RFC5280_UTC,
    .tbs_cert_loc = {
        .offset = 4,
        .count = 428
    },
    .expire_years = 10,
    .public_key_dev_loc = {
        .zone = DEVZONE_DATA,
        .slot = 11,
        .is_genkey = 0,
        .offset = 0,
        .count = 72
    },
    .comp_cert_dev_loc = {
        .zone = DEVZONE_DATA,
        .slot = 12,
        .is_genkey = 0,
        .offset = 0,
        .count = 72
    },
    .std_cert_elements = {
        { // STDCERT_PUBLIC_KEY
            .offset = 264,
            .count = 64
        },
        { // STDCERT_SIGNATURE
            .offset = 444,
            .count = 64
        },
        { // STDCERT_ISSUE_DATE
            .offset = 128,
            .count = 13
        },
        { // STDCERT_EXPIRE_DATE
            .offset = 143,
            .count = 13
        },
        { // STDCERT_SIGNER_ID
            .offset = 233,
            .count = 4
        },
        { // STDCERT_CERT_SN
            .offset = 15,
            .count = 16
        },
        { // STDCERT_AUTH_KEY_ID
            .offset = 412,
            .count = 20
        },
        { // STDCERT_SUBJ_KEY_ID
            .offset = 379,
            .count = 20
        }
    },
    .cert_elements = NULL,
    .cert_elements_count = 0,
    .cert_template = g_cert_template_1_signer,
    .cert_template_size = sizeof(g_cert_template_1_signer)
};

"""

KIT_INFO_FILENAME = 'kit-info.json'

def read_kit_info():
    if not os.path.isfile(KIT_INFO_FILENAME):
        return {}
    with open(KIT_INFO_FILENAME, 'r') as f:
        json_str = f.read()
        if not json_str:
            return {}  # Empty file
        return json.loads(json_str)

def save_kit_info(kit_info):
    with open(KIT_INFO_FILENAME, 'w') as f:
        f.write(json.dumps(kit_info, indent=4, sort_keys=True))

def print_bytes_as_chex(p_bytes, fold_at=16):
    string = ''
    for i in range(len(p_bytes)):
        num = p_bytes[i]
        if (i+1 != len(p_bytes)):
            string += '0x' + '{:02x}'.format(num) + ', '
        else:
            string += '0x' + '{:02x}'.format(num)
        if ((i + 1) % fold_at == 0):
            string += '\n'
    return string

def create_resources_for_c_examples():
    application_bin = 'secureboot_test_app.bin'
    application_h = 'secureboot_test_app.h'
    app_signature_bin = 'secureboot_test_app_sign.bin'
    app_signature_h = 'secureboot_test_app_sign.h'
    with open(application_bin, 'rb') as f:
        app_image = f.read()

    with open(application_h, 'w') as f:
        f.write('uint8_t secureboot_test_app[] = {\n')
        f.write(str(convert_to_hex_bytes(app_image)))
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
        f.write(str(convert_to_hex_bytes(sign_r) + convert_to_hex_bytes(sign_s)))
        f.write('};')

def get_symmetric_key(file_path):
        csr_der = pem.readPemFromFile(open(file_path),
            startMarker='-----BEGIN SYMMETRIC KEY-----',
            endMarker='-----END SYMMETRIC KEY-----')
        data = bytearray()
        data.extend(csr_der[17:((csr_der[14] - 2)+17)])
        return data

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
            assert atcab_write_bytes_zone(ATCA_ZONE_DATA, slot_number, 0, new_key_bytes, slot_size) == ATCA_SUCCESS
        elif (slot_number == 5):
            io_key = pem.readPemFromFile(open("slot_6_secret_key.pem"), startMarker='-----BEGIN SYMMETRIC KEY-----', endMarker='-----END SYMMETRIC KEY-----')
            #print(binascii.hexlify(io_key[17: len(io_key)]))
            io_key = io_key[17: len(io_key)]
            assert atcab_write_enc(slot_number, 0, new_key_bytes, io_key, 6) == ATCA_SUCCESS
            print('\nNOTE: While writing symmetric key into secure element it has to be encrypted with IO protection key. So here, Slot 6 (IO protection key) is written before slot 5 (Symmetric key) \n')

        with open(key_file_name.replace('.pem', '.h'), 'w') as f:
            f.write('uint8_t '+ 'slot_' + str(slot_number) + addstr + '[] = {\n')
            key_for_c = convert_to_hex_bytes(new_key_bytes)
            f.write(str(key_for_c))
            f.write('};')
            f.close()

        with open(key_file_name, 'w') as f:
            #print(convert_symmetric_to_pem(new_key_bytes, slot_size))
            f.write(convert_symmetric_to_pem(new_key_bytes, slot_size))
            f.close()
        print("Slot", slot_number, "is a "+tflexSlotType[slot_number]+' key, created ' + key_file_name+' and programmed')
    elif (slot_type == "reserved"):
        print("Slot", slot_number, "is a general purpose slot of size 416 bytes, no action required")
    elif (slot_type == "sboot_dig"):
        print("Slot", slot_number, "is a secureboot digest slot, slot can only be written through secureboot command")
    elif (slot_type == "cert"):
        print("Slot", slot_number, "is a certificate slot, slot comes pre-programmed with MCHP certficate")
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
        assert atcab_write_bytes_zone(ATCA_ZONE_DATA, slot_number, 0, public_key_slot_data, 72) == ATCA_SUCCESS
        print("Slot", slot_number, "is a "+tflexSlotType[slot_number]+' key slot, created ' + key_file_name+' and programmed')

    else:
        raise ValueError("Undefined slot type")

    return True


def create_self_signed_root(cert_name, cert_validyears):
    # ----------- Generating root CA key ----------- #
    key_file_name = 'ecosystem.key'
    root_CA_file = resource_dir + key_file_name

    print("Generating eco-system CA key")
    priv_key = ec.generate_private_key(ec.SECP256R1(), crypto_be)

    # Save private key to file
    with open(root_CA_file, 'wb') as f:
        pem_key = priv_key.private_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PrivateFormat.PKCS8,
            encryption_algorithm=serialization.NoEncryption())
        f.write(pem_key)
        f.close()

    # ----------- Generating root CA cert ----------- #
    cert_file_name = 'ecosystem.crt'
    root_CA_cert_file = resource_dir + cert_file_name

    print("Generating self signed eco-system CA certificate")
    x509_name = x509.Name([x509.NameAttribute(NameOID.COMMON_NAME, cert_name)])
    basic_contraints = x509.BasicConstraints(ca=True, path_length=0)
    now = datetime.datetime.utcnow()

    cert = (
        x509.CertificateBuilder()
        .serial_number(9999)
        .subject_name(x509_name)
        .issuer_name(x509_name)
        .not_valid_before(now)
        .not_valid_after(now + datetime.timedelta(days = cert_validyears*365))
        .add_extension(basic_contraints, False)
        .public_key(priv_key.public_key())
        .sign(priv_key, hashes.SHA256(), default_backend())
    )
    signed_cert = cert.public_bytes(encoding=serialization.Encoding.PEM)

    # Save certificate to file
    with open(root_CA_cert_file, 'wb') as f:
        signed_cert = cert.public_bytes(encoding=serialization.Encoding.PEM)
        f.write(signed_cert)
        f.close()
    return pem_key, signed_cert


def pubnums_to_bytes(pub_nums):
    return bytes(bytearray.fromhex('%064X%064X' % (pub_nums.x, pub_nums.y)))


def device_cert_sn(size, builder):
    """Cert serial number is the SHA256(Subject public key + Encoded dates)"""

    # Get the public key as X and Y integers concatenated
    pubkey = pubnums_to_bytes(builder._public_key.public_numbers())

    # Get the encoded dates
    expire_years = 10
    enc_dates = bytearray(b'\x00'*3)
    enc_dates[0] = (enc_dates[0] & 0x07) | ((((builder._not_valid_before.year - 2000) & 0x1F) << 3) & 0xFF)
    enc_dates[0] = (enc_dates[0] & 0xF8) | ((((builder._not_valid_before.month) & 0x0F) >> 1) & 0xFF)
    enc_dates[1] = (enc_dates[1] & 0x7F) | ((((builder._not_valid_before.month) & 0x0F) << 7) & 0xFF)
    enc_dates[1] = (enc_dates[1] & 0x83) | (((builder._not_valid_before.day & 0x1F) << 2) & 0xFF)
    enc_dates[1] = (enc_dates[1] & 0xFC) | (((builder._not_valid_before.hour & 0x1F) >> 3) & 0xFF)
    enc_dates[2] = (enc_dates[2] & 0x1F) | (((builder._not_valid_before.hour & 0x1F) << 5) & 0xFF)
    enc_dates[2] = (enc_dates[2] & 0xE0) | ((expire_years & 0x1F) & 0xFF)
    enc_dates = bytes(enc_dates)

    # SAH256 hash of the public key and encoded dates
    digest = hashes.Hash(hashes.SHA256(), backend=default_backend())
    digest.update(pubkey)
    digest.update(enc_dates)
    raw_sn = bytearray(digest.finalize()[:size])
    raw_sn[0] = raw_sn[0] & 0x7F # Force MSB bit to 0 to ensure positive integer
    raw_sn[0] = raw_sn[0] | 0x40 # Force next bit to 1 to ensure the integer won't be trimmed in ASN.1 DER encoding

    try:
        return int.from_bytes(raw_sn, byteorder='big', signed=False)
    except AttributeError:
        return int(binascii.hexlify(raw_sn), 16)


def add_device_extensions(builder, public_key=None, authority_cert=None):
    if public_key == None:
        public_key = builder._public_key # Public key not specified, assume its in the builder (cert builder)

    builder = builder.add_extension(
        x509.BasicConstraints(ca=False, path_length=None),
        critical=True)

    builder = builder.add_extension(
        x509.KeyUsage(
            digital_signature=True,
            content_commitment=False,
            key_encipherment=False,
            data_encipherment=False,
            key_agreement=False,
            key_cert_sign=True,
            crl_sign=True,
            encipher_only=False,
            decipher_only=False),
        critical=True)

    builder = builder.add_extension(
        x509.SubjectKeyIdentifier.from_public_key(public_key),
        critical=False)
    subj_key_id_ext = builder._extensions[-1]  # Save newly created subj key id extension

    if authority_cert:
        # We have an authority certificate, use its subject key id
        builder = builder.add_extension(
            x509.AuthorityKeyIdentifier.from_issuer_subject_key_identifier(
                authority_cert.extensions.get_extension_for_class(x509.SubjectKeyIdentifier)),
            critical=False)
    else:
        # No authority cert, assume this is a CSR and just use its own subject key id
        builder = builder.add_extension(
            x509.AuthorityKeyIdentifier.from_issuer_subject_key_identifier(subj_key_id_ext),
            critical=False)

    return builder


def create_device_cert(cert_def, device_org_name=u'Microchip Technology Inc'):
    # Load device public key
    public_key = bytearray(64)
    assert Status.ATCA_SUCCESS == atcab_get_pubkey(cert_def.public_key_dev_loc.slot, public_key)

    # Convert to the key to PEM format
    public_key_pem = bytearray.fromhex('3059301306072A8648CE3D020106082A8648CE3D03010703420004') + public_key
    public_key_pem = '-----BEGIN PUBLIC KEY-----\n' + base64.b64encode(public_key_pem).decode('ascii') + '\n-----END PUBLIC KEY-----'

    # Convert the key into the cryptography format
    public_key = serialization.load_pem_public_key(public_key_pem.encode('ascii'), default_backend())

    with open("signer-ca.crt", 'rb') as f:
        #print('Loading root cert from ' + f.name)
        signer_ca_cert = x509.load_pem_x509_certificate(f.read(), crypto_be)

    with open('signer-ca.key', 'rb') as f:
        # Load the public key from key file
        signer_private_key = serialization.load_pem_private_key(
                        data=f.read(),
                        password=None,
                        backend=default_backend())
    signer_public_key = signer_private_key.public_key()


    # Create the private key
    #signer_private_key = ec.generate_private_key(ec.SECP256R1(), default_backend())
    #signer_public_key = signer_private_key.public_key()

    # Create the certificate builder
    builder = x509.CertificateBuilder()

    # Ordinarily we'd construct a signer cert first, but we'll skip that and just create the fields we need
    builder = builder.issuer_name(x509.Name([
        x509.NameAttribute(x509.oid.NameOID.ORGANIZATION_NAME, device_org_name),
        x509.NameAttribute(x509.oid.NameOID.COMMON_NAME, u'Crypto Authentication Signer FFFF')]))

    # Device cert must have minutes and seconds set to 0
    not_before = datetime.datetime.utcnow().replace(tzinfo=datetime.timezone.utc).replace(minute=0, second=0)
    if not_before.month == 2 and not_before.day == 29:
        # Compressed certs don't handle leap years, fudge the date a little
        not_before.day = 28
    builder = builder.not_valid_before(not_before)
    builder = builder.not_valid_after(not_before.replace(year=not_before.year + 10))

    sernum = bytearray(9)
    assert atcab_read_serial_number(sernum) == ATCA_SUCCESS

    common_name_cert = binascii.hexlify(sernum).decode("utf-8").upper() + "_ATECC"

    #print(common_name_cert)

    builder = builder.subject_name(x509.Name([
        x509.NameAttribute(x509.oid.NameOID.ORGANIZATION_NAME, device_org_name),
        x509.NameAttribute(x509.oid.NameOID.COMMON_NAME, common_name_cert)]))

    builder = builder.public_key(public_key)

    # Device certificate is generated from certificate dates and public key
    builder = builder.serial_number(device_cert_sn(16, builder))

    builder = add_device_extensions(
        builder=builder,
        authority_cert=signer_ca_cert)

    # Sign certificate
    device_cert = builder.sign(private_key=signer_private_key, algorithm=hashes.SHA256(), backend=default_backend())

    # Get the certificate bytes
    #device_cert_bytes = device_cert.public_bytes(encoding=serialization.Encoding.DER)

    # Convert the signer public key into the uncompressed numbers format
    signer_public_key_bytes = pubnums_to_bytes(signer_public_key.public_numbers())

    return device_cert

def mchp_cert():
    mchp_cert_bckp()

    # If certificate is a mchp certificate, then generate manifest file.
    if(isTNG() == ATCA_SUCCESS):
        tflxtls_mchp_manifest()

def custom_cert(org_name):
    mchp_cert_bckp()

    #org_name = input ("\n\rEnter organization name - Max 24 Characters(including spaces)\n\r")
    assert len(org_name) < 25, "Org name can be maximum of 24 characters"

    for i in range(24 - len(org_name)):
        org_name += " "

    assert len(org_name) == 24, "Invalid size: org_name"

    print('\n\r---------------------------------------------\n\r')

    # Create root key and self signed cert
    root_pub_key = ca_create_root(root_org_name=org_name)

    # Create signer CSR
    ca_create_signer_csr(signer_csr_org_name=org_name)

    # Create signer certificate
    signer_cert_der = ca_create_signer()

    print('\n\r---------------------------------------------')
    # Create a signer_cert_def object from the configuration
    signer_cert_def = atcacert_def_t(**ATCACERT_DEF_SIGNER_CONFIG)

    # Attach the template to the signer_cert_def
    signer_cert_def.cert_template_size = len(signer_cert_der)
    signer_cert_def.cert_template = POINTER(c_uint8)(create_string_buffer(bytes(signer_cert_der), signer_cert_def.cert_template_size))

    # Take a full certificate and write it to the ATECC508A device according to the certificate definition.
    assert atcacert_write_cert(signer_cert_def, signer_cert_der, len(signer_cert_der)) == ATCA_SUCCESS

    print("\n\rSigner Certificate written successfully to device")

    # Preparing device certificate template

    # Create a certdef object from the configuration
    device_cert_def = atcacert_def_t(**ATCACERT_DEF_DEVICE_CONFIG)
    device_cert = create_device_cert(device_cert_def, device_org_name=org_name)
    device_cert_der =  device_cert.public_bytes(encoding=serialization.Encoding.DER)

    # Attach the template to the cert_def
    device_cert_def.cert_template_size = len(device_cert_der)
    device_cert_def.cert_template = POINTER(c_uint8)(create_string_buffer(bytes(device_cert_der), device_cert_def.cert_template_size))

    with open('device_cert.crt', 'wb') as f:
        f.write(device_cert.public_bytes(encoding=serialization.Encoding.PEM))
        f.close()

    # Take a full certificate and write it to the ATECC508A device according to the certificate definition.
    assert atcacert_write_cert(device_cert_def, device_cert_der, len(device_cert_der)) == ATCA_SUCCESS

    print("Device Certificate written successfully to device")
    for extension in device_cert.extensions:
        if extension.oid._name != 'subjectKeyIdentifier':
            continue # Not the extension we're looking for, skip
        thing_name = binascii.b2a_hex(extension.value.digest).decode('ascii')
    print('Thing ID {}'.format(thing_name))

    kit_info = read_kit_info()
    kit_info['thing_name'] = thing_name.lower()
    save_kit_info(kit_info)

    print('\n\r---------------------------------------------\n\r')

    print("Generating signer certificate definition header file - cust_def_1_signer.h")

    # Save def to file
    with open('cust_def_1_signer.h', 'w') as f:
        f.write(cert_def_1_signer_h)
        f.close()

    print("Generating device certificate definition header file - cust_def_2_device.h")

    # Save def to file
    with open('cust_def_2_device.h', 'w') as f:
        f.write(cert_def_2_device_h)
        f.close()

    print("Generating signer certificate definition source file - cust_def_1_signer.c")

    # Save def to file
    with open('cust_def_1_signer.c', 'w') as f:
        f.write(cert_def_1_signer_c_p1 + '\n' + print_bytes_as_chex(signer_cert_der) + '\n' + cert_ca_public_key_1_signer + '\n' + print_bytes_as_chex(root_pub_key) + '\n' + cert_def_1_signer_c_p2)
        f.close()

    print("Generating device certificate definition source file - cust_def_2_device.c\n\r")

    # Save def to file
    with open('cust_def_2_device.c', 'w') as f:
        f.write(cert_def_2_device_c_p1 + '\n' + print_bytes_as_chex(device_cert_der) + '\n' + cert_def_2_device_c_p2)
        f.close()

    print('---------------------------------------------\n\r')

    print('Custom certificate generation and provisioning - SUCCESS')

    print('\n\r---------------------------------------------\n\r')
    tflxtls_custom_manifest()