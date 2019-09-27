import time
import unicodedata
import sys
import base64
import os.path
import binascii
import ctypes

from cryptography.hazmat.backends import default_backend
from cryptography import x509
from cryptography.hazmat.primitives.serialization import Encoding, PublicFormat
from cryptography.hazmat.primitives.asymmetric import ec
from cryptography.hazmat.primitives import hashes
from cryptography.utils import int_from_bytes
from cryptoauthlib import *
from common import *
from cryptography.hazmat.primitives import serialization

ATCA_SUCCESS = 0x00

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
    'expire_date_format': atcacert_date_format_t.DATEFMT_RFC5280_GEN,
    'tbs_cert_loc': {'offset': 4, 'count': 430},
    'expire_years': 31,
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
        {'offset': 266, 'count': 64},
        {'offset': 446, 'count': 64},
        {'offset': 128, 'count': 13},
        {'offset': 143, 'count': 15},
        {'offset': 235, 'count': 4},
        {'offset': 15, 'count': 16},
        {'offset': 414, 'count': 20},
        {'offset': 381, 'count': 20},
    ]
}

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
    'expire_date_format': atcacert_date_format_t.DATEFMT_RFC5280_GEN,
    'tbs_cert_loc': {'offset': 4, 'count': 415},
    'expire_years': 28,
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
        {'offset': 257, 'count': 64},
        {'offset': 431, 'count': 64},
        {'offset': 128, 'count': 13},
        {'offset': 143, 'count': 15},
        {'offset': 120, 'count': 4},
        {'offset': 15, 'count': 16},
        {'offset': 399, 'count': 20},
        {'offset': 366, 'count': 20},
    ]
}


def get_common_name(name):
    """
    Get the common name string from a distinguished name (RDNSequence)
    """
    for attr in name:
        if attr.oid == x509.oid.NameOID.COMMON_NAME:
            return attr.value
    return None

def isTNG():
    root_cert_der_size = AtcaReference(0)
    assert tng_atcacert_root_cert_size(root_cert_der_size) == ATCA_SUCCESS

    root_cert_der = bytearray(root_cert_der_size.value)
    assert tng_atcacert_root_cert(root_cert_der, root_cert_der_size) == ATCA_SUCCESS
    root_cert = x509.load_der_x509_certificate(root_cert_der, default_backend())

    # Note that we could, of course, pull this from the root certificate above.
    # However, this demonstrates the tng_atcacert_root_public_key() function.
    root_public_key_raw = bytearray(64)
    assert tng_atcacert_root_public_key(root_public_key_raw) == ATCA_SUCCESS

    root_public_key = ec.EllipticCurvePublicNumbers(
        curve=ec.SECP256R1(),
        x=int_from_bytes(root_public_key_raw[0:32], byteorder='big'),
        y=int_from_bytes(root_public_key_raw[32:64], byteorder='big'),
    ).public_key(default_backend())

    cert_spk_der = root_cert.public_key().public_bytes(
        format=PublicFormat.SubjectPublicKeyInfo,
        encoding=Encoding.DER
    )
    func_spk_der = root_public_key.public_bytes(
        format=PublicFormat.SubjectPublicKeyInfo,
        encoding=Encoding.DER
    )
    assert cert_spk_der == func_spk_der

    root_public_key.verify(
        signature=root_cert.signature,
        data=root_cert.tbs_certificate_bytes,
        signature_algorithm=ec.ECDSA(root_cert.signature_hash_algorithm)
    )

    signer_cert_der_size = AtcaReference(0)
    assert tng_atcacert_max_signer_cert_size(signer_cert_der_size) == ATCA_SUCCESS

    signer_cert_der = bytearray(signer_cert_der_size.value)
    assert tng_atcacert_read_signer_cert(signer_cert_der, signer_cert_der_size) == ATCA_SUCCESS
    signer_cert = x509.load_der_x509_certificate(signer_cert_der, default_backend())
    
    # Note that we could, of course, pull this from the signer certificate above.
    # However, this demonstrates the tng_atcacert_signer_public_key() function.
    signer_public_key_raw = bytearray(64)
    assert tng_atcacert_signer_public_key(signer_public_key_raw) == ATCA_SUCCESS

    signer_public_key = ec.EllipticCurvePublicNumbers(
        curve=ec.SECP256R1(),
        x=int_from_bytes(signer_public_key_raw[0:32], byteorder='big'),
        y=int_from_bytes(signer_public_key_raw[32:64], byteorder='big'),
    ).public_key(default_backend())

    # Prove that cert public key and the public key from the func are the same
    cert_spk_der = signer_cert.public_key().public_bytes(
        format=PublicFormat.SubjectPublicKeyInfo,
        encoding=Encoding.DER
    )
    func_spk_der = signer_public_key.public_bytes(
        format=PublicFormat.SubjectPublicKeyInfo,
        encoding=Encoding.DER
    )
    assert cert_spk_der == func_spk_der

    # Note that this is a simple cryptographic validation and does not check
    # any of the actual certificate data (validity dates, extensions, names,
    # etc...)    
    try:
        root_public_key.verify(
            signature=signer_cert.signature,
            data=signer_cert.tbs_certificate_bytes,
            signature_algorithm=ec.ECDSA(signer_cert.signature_hash_algorithm)
        )
    except:
        # Not a MCHP certificate
        # print("MCHP certificate not found. - signer \n")
        return 1

    device_cert_der_size = AtcaReference(0)
    assert tng_atcacert_max_device_cert_size(device_cert_der_size) == ATCA_SUCCESS

    device_cert_der = bytearray(device_cert_der_size.value)
    assert tng_atcacert_read_device_cert(device_cert_der, device_cert_der_size) == ATCA_SUCCESS
    device_cert = x509.load_der_x509_certificate(device_cert_der, default_backend())

    # Note that we could, of course, pull this from the device certificate above.
    # However, this demonstrates the tng_atcacert_device_public_key() function.
    device_public_key_raw = bytearray(64)
    assert tng_atcacert_device_public_key(device_public_key_raw, device_cert_der) == ATCA_SUCCESS

    device_public_key = ec.EllipticCurvePublicNumbers(
        curve=ec.SECP256R1(),
        x=int_from_bytes(device_public_key_raw[0:32], byteorder='big'),
        y=int_from_bytes(device_public_key_raw[32:64], byteorder='big'),
    ).public_key(default_backend())

    # Prove that cert public key and the public key from the func are the same
    cert_spk_der = device_cert.public_key().public_bytes(
        format=PublicFormat.SubjectPublicKeyInfo,
        encoding=Encoding.DER
    )
    func_spk_der = device_public_key.public_bytes(
        format=PublicFormat.SubjectPublicKeyInfo,
        encoding=Encoding.DER
    )
    assert cert_spk_der == func_spk_der

    # Note that this is a simple cryptographic validation and does not check
    # any of the actual certificate data (validity dates, extensions, names,
    # etc...)  

    try:
        signer_public_key.verify(
            signature=device_cert.signature,
            data=device_cert.tbs_certificate_bytes,
            signature_algorithm=ec.ECDSA(device_cert.signature_hash_algorithm)
        )
    except:
        # Not a MCHP certificate
        # print("MCHP certificate not found. -  device\n")
        return 1
    
    # print('Valid MCHP certificate found in the device.\n')
    return ATCA_SUCCESS

def mchp_cert_bckp():
    serial_number = bytearray(9)
    assert atcab_read_serial_number(serial_number) == ATCA_SUCCESS

    device_file_name = str(binascii.hexlify(serial_number), 'utf-8').upper() + "_device.crt"
    signer_file_name = str(binascii.hexlify(serial_number), 'utf-8').upper() + "_signer.crt"
    
    if(isTNG() == ATCA_SUCCESS):
        print("MCHP certificates found in the device\r\n")
        if(os.path.exists(os.path.join('mchpcert_bckp', device_file_name))):
            # Backup already exists, skip this step
            print("Backup of certificates already exist\n\r")
        else:
            print("Backing up certificates from device\n\r")

            # Get signer backup    
            signer_cert_der_size = AtcaReference(0)
            assert tng_atcacert_max_signer_cert_size(signer_cert_der_size) == ATCA_SUCCESS
            
            signer_cert_der = bytearray(signer_cert_der_size.value)
            assert tng_atcacert_read_signer_cert(signer_cert_der, signer_cert_der_size) == ATCA_SUCCESS

            # Get device backup
            device_cert_der_size = AtcaReference(0)
            assert tng_atcacert_max_device_cert_size(device_cert_der_size) == ATCA_SUCCESS

            device_cert_der = bytearray(device_cert_der_size.value)
            assert tng_atcacert_read_device_cert(device_cert_der, device_cert_der_size) == ATCA_SUCCESS

            # Store local backups of device and signer certificate
            device_file_name = str(binascii.hexlify(serial_number), 'utf-8').upper() + "_device.crt"
            signer_file_name = str(binascii.hexlify(serial_number), 'utf-8').upper() + "_signer.crt"

            with open(os.path.join('mchpcert_bckp', signer_file_name), "wb") as f:
                f.write(signer_cert_der)

            with open(os.path.join('mchpcert_bckp', device_file_name), "wb") as f:
                f.write(device_cert_der)
            
            print("Backing up certificates from device - Success\n\r")
    else:
        # print("MCHP certificates not found in the device\r\n")
        # Device does not contain a valid MCHP cert
        # Check for backups
        if(os.path.exists(os.path.join('mchpcert_bckp', device_file_name))):
            # Backup exists, restore certs
            # print("Restoring device and signer certs\n\r")

            # Restore signer cert
            with open(os.path.join('mchpcert_bckp', signer_file_name), 'rb') as f:
                cert = x509.load_der_x509_certificate(f.read(), default_backend())

            cert_def = atcacert_def_t(**ATCACERT_DEF_SIGNER_CONFIG)
            cert = cert.public_bytes(encoding=serialization.Encoding.DER)
            assert Status.ATCA_SUCCESS == atcacert_write_cert(cert_def, cert, len(cert))            

            # Restore device cert
            with open(os.path.join('mchpcert_bckp', device_file_name), 'rb') as f:
                cert = x509.load_der_x509_certificate(f.read(), default_backend())

            cert_def = atcacert_def_t(**ATCACERT_DEF_DEVICE_CONFIG)
            cert = cert.public_bytes(encoding=serialization.Encoding.DER)
            assert Status.ATCA_SUCCESS == atcacert_write_cert(cert_def, cert, len(cert))

            print("Restoring MCHP device and signer certificates - Success\n\r")


        else:
            # Backup does not exist.
            print("Device contains custom device and signer certificates\n\r")
            pass
