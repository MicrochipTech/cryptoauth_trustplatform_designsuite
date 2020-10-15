import sys
import os.path
import binascii
from pathlib import Path
from cryptography.hazmat.backends import default_backend
from cryptography import x509
from cryptography.hazmat.primitives.serialization import Encoding
from cryptography.hazmat.primitives.asymmetric import ec
from cryptoauthlib import *
from certs_handler import *


def isMCHP_cert():
    try:
        root_cert_der_size = AtcaReference(0)
        assert tng_atcacert_root_cert_size(root_cert_der_size) == Status.ATCA_SUCCESS
        root_cert_der = bytearray(root_cert_der_size.value)
        assert tng_atcacert_root_cert(root_cert_der, root_cert_der_size) == Status.ATCA_SUCCESS
        root_cert = x509.load_der_x509_certificate(root_cert_der, default_backend())

        # Note that this is a simple cryptographic validation and does not check
        # any of the actual certificate data (validity dates, extensions, names,
        # etc...)
        root_cert.public_key().verify(
            signature=root_cert.signature,
            data=root_cert.tbs_certificate_bytes,
            signature_algorithm=ec.ECDSA(root_cert.signature_hash_algorithm)
        )

        signer_cert_der_size = AtcaReference(0)
        assert tng_atcacert_max_signer_cert_size(signer_cert_der_size) == Status.ATCA_SUCCESS
        signer_cert_der = bytearray(signer_cert_der_size.value)
        assert tng_atcacert_read_signer_cert(signer_cert_der, signer_cert_der_size) == Status.ATCA_SUCCESS
        signer_cert = x509.load_der_x509_certificate(signer_cert_der, default_backend())

        # Note that this is a simple cryptographic validation and does not check
        # any of the actual certificate data (validity dates, extensions, names,
        # etc...)
        root_cert.public_key().verify(
            signature=signer_cert.signature,
            data=signer_cert.tbs_certificate_bytes,
            signature_algorithm=ec.ECDSA(signer_cert.signature_hash_algorithm)
        )

        device_cert_der_size = AtcaReference(0)
        assert tng_atcacert_max_device_cert_size(device_cert_der_size) == Status.ATCA_SUCCESS
        device_cert_der = bytearray(device_cert_der_size.value)
        assert tng_atcacert_read_device_cert(device_cert_der, device_cert_der_size) == Status.ATCA_SUCCESS
        device_cert = x509.load_der_x509_certificate(device_cert_der, default_backend())

        # Note that this is a simple cryptographic validation and does not check
        # any of the actual certificate data (validity dates, extensions, names,
        # etc...)
        signer_cert.public_key().verify(
            signature=device_cert.signature,
            data=device_cert.tbs_certificate_bytes,
            signature_algorithm=ec.ECDSA(device_cert.signature_hash_algorithm)
        )

        return {'status':Status.ATCA_SUCCESS, 'root_cert':root_cert, 'signer_cert':signer_cert, 'device_cert':device_cert}
    except:
        return {'status':1}


def get_signer_cert_signer_id(name):
    """
    Get the Signer ID string from a Subject common name
    """
    for attr in name:
        if attr.oid == x509.oid.NameOID.COMMON_NAME:
            return attr.value[-4:]
    return None


def mchp_cert_bckp(mchp_cert_info):
    serial_number = bytearray(9)
    assert atcab_read_serial_number(serial_number) == Status.ATCA_SUCCESS

    trustplatform_directory = ".trustplatform"
    mchp_cert_directory = os.path.join(Path.home(), trustplatform_directory, "mchp_certs_bckp")
    ser_num_str = str(binascii.hexlify(serial_number), 'utf-8').upper()
    root_cert_path = os.path.join(mchp_cert_directory, ser_num_str + "_root.der")
    signer_cert_path =  os.path.join(mchp_cert_directory, ser_num_str + "_signer.der")
    device_cert_path =  os.path.join(mchp_cert_directory, ser_num_str + "_device.der")

    if(mchp_cert_info['status'] == Status.ATCA_SUCCESS):
        if not os.path.exists(mchp_cert_directory):
            os.mkdir(mchp_cert_directory)
        print("MCHP certificates found in the device, backing up...", end='')
        root_cert_der = mchp_cert_info['root_cert'].public_bytes(encoding=Encoding.DER)
        with open(root_cert_path, "wb") as f:
            f.write(root_cert_der)

        signer_cert_der = mchp_cert_info['signer_cert'].public_bytes(encoding=Encoding.DER)
        with open(signer_cert_path, "wb") as f:
            f.write(signer_cert_der)

        device_cert_der = mchp_cert_info['device_cert'].public_bytes(encoding=Encoding.DER)
        with open(device_cert_path, "wb") as f:
            f.write(device_cert_der)
        print("OK")
        status = Status.ATCA_SUCCESS
    else:
        # Device does not contain a valid MCHP cert
        # Check for backups
        if ((os.path.exists(root_cert_path)) and
            (os.path.exists(signer_cert_path)) and
            (os.path.exists(device_cert_path))):

            # Backup exists, restore certs
            signer_id = get_signer_cert_signer_id(read_cert(signer_cert_path).subject)
            signer_cert_def, device_cert_def = certs_handler.generate_cert_def_files(root_cert_path, signer_id, signer_cert_path, device_cert_path)

            print('Saving signer certificate to device...', end='')
            signer_cert_der = read_cert(signer_cert_path).public_bytes(encoding=Encoding.DER)
            assert Status.ATCA_SUCCESS == atcacert_write_cert(signer_cert_def, signer_cert_der, len(signer_cert_der))
            print('OK')

            print('Saving device certificate to device...', end='')
            device_cert_der = read_cert(device_cert_path).public_bytes(encoding=Encoding.DER)
            assert Status.ATCA_SUCCESS == atcacert_write_cert(device_cert_def, device_cert_der, len(device_cert_der))
            print('OK')

            print("Restoring MCHP device and signer certificates - Success\n\r")
            status = Status.ATCA_SUCCESS
        else:
            # Backup does not exist.
            print("Device contains custom device and signer certificates")
            status = 1

    return status
