"""
Manifest generation
"""
# (c) 2015-2019 Microchip Technology Inc. and its subsidiaries.
#
# Subject to your compliance with these terms, you may use Microchip software
# and any derivatives exclusively with Microchip products. It is your
# responsibility to comply with third party license terms applicable to your
# use of third party software (including open source software) that may
# accompany Microchip software.
#
# THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
# EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
# WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
# PARTICULAR PURPOSE. IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT,
# SPECIAL, PUNITIVE, INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE
# OF ANY KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF
# MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE
# FORESEEABLE. TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL
# LIABILITY ON ALL CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED
# THE AMOUNT OF FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR
# THIS SOFTWARE.

import time
import unicodedata
import re
import sys
import json
import base64
import ctypes

from cryptography.hazmat.backends import default_backend
from cryptography import x509
from cryptography.hazmat.primitives.serialization import Encoding, PublicFormat
from cryptography.hazmat.primitives.asymmetric import ec
from cryptography.hazmat.primitives import hashes
from cryptography.utils import int_from_bytes
from cryptoauthlib import *
from common import *
from jose import jws, utils
from cryptography.hazmat.primitives import serialization

from manifest_signing_helper import *

ROOT_CERT = 'root-ca.crt'
SIGNER_CERT = 'signer-ca.crt'
DEVICE_CERT = 'device_cert.crt'
LOGGING_KEY = 'log_signer.key'
LOGGING_CERT = 'log_signer.crt'
ATCA_SUCCESS = 0x00


ATCACERT_DEF_SIGNER_CONFIG_ELEMENTS = (atcacert_cert_element_t*3)(
    atcacert_cert_element_t(
#        id='IssueDate',
        device_loc = atcacert_device_loc_t(**{
            'zone': atcacert_device_zone_t.DEVZONE_DATA,
            'slot': 14,
            'is_genkey': 0,
            'offset': 35-13,
            'count': 13}),
        cert_loc= atcacert_cert_loc_t(offset=97, count=13)
    ),
    atcacert_cert_element_t(
#        id='ExpireDate',
        device_loc = atcacert_device_loc_t(**{
            'zone': atcacert_device_zone_t.DEVZONE_DATA,
            'slot': 14,
            'is_genkey': 0,
            'offset': 50-13,
            'count': 13}),
        cert_loc = atcacert_cert_loc_t(offset=112, count=13)
    ),
    atcacert_cert_element_t(
#        id='AuthorityKeyId',
        device_loc = atcacert_device_loc_t(**{
            'zone': atcacert_device_zone_t.DEVZONE_DATA,
            'slot': 8,
            'is_genkey': 0,
            'offset': 0,
            'count': 20}),
        cert_loc = atcacert_cert_loc_t(offset=354, count=20)
    )
)


ATCACERT_DEF_SIGNER_CONFIG = {
    'type': atcacert_cert_type_t.CERTTYPE_X509,
    'template_id': 1,
    'chain_id': 0,
    'private_key_slot': 0,
    'sn_source': atcacert_cert_sn_src_t.SNSRC_STORED,
    'cert_sn_dev_loc': {
        'zone': atcacert_device_zone_t.DEVZONE_DATA,
        'slot': 14,
        'is_genkey': 0,
        'offset': 20-16,
        'count': 16
    },
    'issue_date_format': atcacert_date_format_t.DATEFMT_RFC5280_UTC,
    'expire_date_format': atcacert_date_format_t.DATEFMT_RFC5280_UTC,
    'tbs_cert_loc': {'offset': 4, 'count': 370},
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
        {'offset': 206, 'count': 64},
        {'offset': 386, 'count': 74},
        {'offset': 97, 'count': 13},
        {'offset': 112, 'count': 13},
        {'offset': 175, 'count': 4},
        {'offset': 15, 'count': 16},
        {'offset': 354, 'count': 20},
        {'offset': 321, 'count': 20},
    ],
    'cert_elements': ctypes.cast(ATCACERT_DEF_SIGNER_CONFIG_ELEMENTS, ctypes.POINTER(atcacert_cert_element_t)),
    'cert_elements_count': len(ATCACERT_DEF_SIGNER_CONFIG_ELEMENTS)
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
    'tbs_cert_loc': {'offset': 4, 'count': 339},
    'expire_years': 0,
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
        {'offset': 211, 'count': 64},
        {'offset': 355, 'count': 75},
        {'offset': 101, 'count': 13},
        {'offset': 0, 'count': 0},
        {'offset': 93, 'count': 4},
        {'offset': 15, 'count': 16},
        {'offset': 323, 'count': 20},
        {'offset': 290, 'count': 20},
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

def make_valid_filename(s):
    """
    Convert an arbitrary string into one that can be used in an ascii filename.
    """
    if sys.version_info[0] <= 2:
        if not isinstance(s, unicode):
            s = str(s).decode('utf-8')
    else:
         s = str(s)
    # Normalize unicode characters
    s = unicodedata.normalize('NFKD', s).encode('ascii', 'ignore').decode('ascii')
    # Remove non-word and non-whitespace characters
    s = re.sub(r'[^\w\s-]', '', s).strip()
    # Replace repeated whitespace with an underscore
    s = re.sub(r'\s+', '_', s)
    # Replace repeated dashes with a single dash
    s = re.sub(r'-+', '-', s)
    return s


def generate_manifest(signer_certificate, device_certificate, log_key_path=LOGGING_KEY, log_cert_path=LOGGING_CERT):
    device_entry = {
        'version': 1,
        'model': 'ATECC608A',
        'partNumber': 'ATECC608A-TFLXTLS',
        'manufacturer': {
            'organizationName': 'Microchip Technology Inc',
            'organizationalUnitName': 'Secure Products Group'
        },
        'provisioner': {
            'organizationName': 'Microchip Technology Inc',
            'organizationalUnitName': 'Secure Products Group'
        },
        'distributor': {
            'organizationName': 'Microchip Technology Inc',
            'organizationalUnitName': 'Microchip Direct'
        }
    }

    device_entry['provisioningTimestamp']=device_certificate.not_valid_before.strftime('%Y-%m-%dT%H:%M:%S.%f')[:-3] + 'Z'

    serial_number = bytearray(9)
    assert atcab_read_serial_number(serial_number) == ATCA_SUCCESS
    device_entry['uniqueId'] = serial_number.hex()

    device_entry['publicKeySet'] = {
        'keys' : [
            {
                'kid' : '0',
                'kty' : 'EC',
                'crv' : 'P-256',
                'x'   : None,
                'y'   : None,
                'x5c' : [
                    base64.b64encode(device_certificate.public_bytes(encoding=serialization.Encoding.DER)).decode('ascii'),
                    base64.b64encode(signer_certificate.public_bytes(encoding=serialization.Encoding.DER)).decode('ascii')
                ]
            },
            {
                'kid' : '1',
                'kty' : 'EC',
                'crv' : 'P-256',
                'x'   : None,
                'y'   : None,
            },
            {
                'kid' : '2',
                'kty' : 'EC',
                'crv' : 'P-256',
                'x'   : None,
                'y'   : None,
            },
            {
                'kid' : '3',
                'kty' : 'EC',
                'crv' : 'P-256',
                'x'   : None,
                'y'   : None,
            },
            {
                'kid' : '4',
                'kty' : 'EC',
                'crv' : 'P-256',
                'x'   : None,
                'y'   : None,
            }
        ]
    }

    for key in device_entry['publicKeySet']['keys']:
        public_key = bytearray(64)
        print('reading slot {} public key'.format(key['kid']))
        assert atcab_get_pubkey(int(key['kid']), public_key) == ATCA_SUCCESS
        key['x'] = utils.base64url_encode(public_key[0:32]).decode('ascii')
        key['y'] = utils.base64url_encode(public_key[32:64]).decode('ascii')

    # If a logging key and certificate was provided create a manifest file
    log_key, log_cert = load_key_and_cert(log_key_path, log_cert_path)

    # Generate the key and certificate ids for JWS
    log_key_id = jws_b64encode(log_cert.extensions.get_extension_for_class(x509.SubjectKeyIdentifier).value.digest)
    log_cert_id = jws_b64encode(log_cert.fingerprint(hashes.SHA256()))

    # Precompute the JWT header
    jws_header = {'typ': 'JWT', 'alg': 'ES256', 'kid': log_key_id, 'x5t#S256': log_cert_id}
    jws_header = jws_b64encode(json.dumps(jws_header).encode('ascii'))

    manifest = json.dumps([create_signed_entry(device_entry, log_key, jws_header)], indent=2).encode('ascii')

    filename = make_valid_filename(device_entry['uniqueId']) + '_manifest' + '.json'
    with open(filename, 'wb') as f:
        f.write(manifest)
    print('\n\nGenerated the manifest file ' + filename)


def tflxtls_custom_manifest():

    print('Root Certificate:')
    with open(ROOT_CERT, 'rb') as f:
        print('    Loading from ' + f.name)
        root_cert = x509.load_pem_x509_certificate(f.read(), default_backend())

    print(get_common_name(root_cert.subject))
    print(root_cert.public_bytes(encoding=Encoding.PEM).decode('utf-8'))
    root_public_key = root_cert.public_key()


    print('Validate Root Certificate:')
    root_public_key.verify(
        signature=root_cert.signature,
        data=root_cert.tbs_certificate_bytes,
        signature_algorithm=ec.ECDSA(root_cert.signature_hash_algorithm)
    )
    print('OK\n')


    print('TFLXTLS Signer Certificate:')
    with open(SIGNER_CERT, 'rb') as f:
        print('    Loading from ' + f.name)
        signer_cert = x509.load_pem_x509_certificate(f.read(), default_backend())


    print(get_common_name(signer_cert.subject))
    print(signer_cert.public_bytes(encoding=Encoding.PEM).decode('utf-8'))
    signer_public_key = signer_cert.public_key()

    print('Validate TFLXTLS Signer Certificate:')
    root_public_key.verify(
        signature=signer_cert.signature,
        data=signer_cert.tbs_certificate_bytes,
        signature_algorithm=ec.ECDSA(signer_cert.signature_hash_algorithm)
    )
    print('OK\n')


    print('TFLXTLS Device Certificate:')

    with open(DEVICE_CERT, 'rb') as f:
        print('    Loading from ' + f.name)
        device_cert = x509.load_pem_x509_certificate(f.read(), default_backend())
    print(get_common_name(device_cert.subject))
    print(device_cert.public_bytes(encoding=Encoding.PEM).decode('utf-8'))

    print('Validate Device Certificate:')
    signer_public_key.verify(
        signature=device_cert.signature,
        data=device_cert.tbs_certificate_bytes,
        signature_algorithm=ec.ECDSA(device_cert.signature_hash_algorithm)
    )
    print('OK\n')
    generate_manifest(signer_cert,device_cert)



def tflxtls_mchp_manifest():

    certs = []

    print('TFLXTLS Root Certificate:')
    root_cert_der_size = AtcaReference(0)
    assert tng_atcacert_root_cert_size(root_cert_der_size) == ATCA_SUCCESS

    root_cert_der = bytearray(root_cert_der_size.value)
    assert tng_atcacert_root_cert(root_cert_der, root_cert_der_size) == ATCA_SUCCESS

    root_cert = x509.load_der_x509_certificate(root_cert_der, default_backend())
    certs.insert(0, root_cert)

    print(get_common_name(root_cert.subject))
    print(root_cert.public_bytes(encoding=Encoding.PEM).decode('utf-8'))


    print('TFLXTLS Root Public Key:')
    # Note that we could, of course, pull this from the root certificate above.
    # However, this demonstrates the tng_atcacert_root_public_key() function.
    root_public_key_raw = bytearray(64)
    assert tng_atcacert_root_public_key(root_public_key_raw) == ATCA_SUCCESS

    root_public_key = ec.EllipticCurvePublicNumbers(
        curve=ec.SECP256R1(),
        x=int_from_bytes(root_public_key_raw[0:32], byteorder='big'),
        y=int_from_bytes(root_public_key_raw[32:64], byteorder='big'),
    ).public_key(default_backend())

    # Prove that cert public key and the public key from the func are the same
    cert_spk_der = root_cert.public_key().public_bytes(
        format=PublicFormat.SubjectPublicKeyInfo,
        encoding=Encoding.DER
    )
    func_spk_der = root_public_key.public_bytes(
        format=PublicFormat.SubjectPublicKeyInfo,
        encoding=Encoding.DER
    )
    assert cert_spk_der == func_spk_der

    print(root_public_key.public_bytes(
        format=PublicFormat.SubjectPublicKeyInfo,
        encoding=Encoding.PEM
    ).decode('utf-8'))


    print('Validate Root Certificate:')
    root_public_key.verify(
        signature=root_cert.signature,
        data=root_cert.tbs_certificate_bytes,
        signature_algorithm=ec.ECDSA(root_cert.signature_hash_algorithm)
    )
    print('OK\n')


    print('TFLXTLS Signer Certificate:')
    signer_cert_der_size = AtcaReference(0)
    assert tng_atcacert_max_signer_cert_size(signer_cert_der_size) == ATCA_SUCCESS

    signer_cert_der = bytearray(signer_cert_der_size.value)
    assert tng_atcacert_read_signer_cert(signer_cert_der, signer_cert_der_size) == ATCA_SUCCESS

    signer_cert = x509.load_der_x509_certificate(signer_cert_der, default_backend())
    certs.insert(0, signer_cert)

    print(get_common_name(signer_cert.subject))
    print(signer_cert.public_bytes(encoding=Encoding.PEM).decode('utf-8'))


    print('TFLXTLS Signer Public Key:')
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

    print(signer_public_key.public_bytes(
        format=PublicFormat.SubjectPublicKeyInfo,
        encoding=Encoding.PEM
    ).decode('utf-8'))


    # Note that this is a simple cryptographic validation and does not check
    # any of the actual certificate data (validity dates, extensions, names,
    # etc...)
    print('Validate Signer Certificate:')
    root_public_key.verify(
        signature=signer_cert.signature,
        data=signer_cert.tbs_certificate_bytes,
        signature_algorithm=ec.ECDSA(signer_cert.signature_hash_algorithm)
    )
    print('OK\n')


    print('TNG Device Certificate:')
    device_cert_der_size = AtcaReference(0)
    assert tng_atcacert_max_device_cert_size(device_cert_der_size) == ATCA_SUCCESS

    device_cert_der = bytearray(device_cert_der_size.value)
    assert tng_atcacert_read_device_cert(device_cert_der, device_cert_der_size) == ATCA_SUCCESS

    device_cert = x509.load_der_x509_certificate(device_cert_der, default_backend())
    certs.insert(0, device_cert)

    print(get_common_name(device_cert.subject))
    print(device_cert.public_bytes(encoding=Encoding.PEM).decode('utf-8'))


    print('TFLXTLS Device Public Key:')
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

    print(device_public_key.public_bytes(
        format=PublicFormat.SubjectPublicKeyInfo,
        encoding=Encoding.PEM
    ).decode('utf-8'))


    # Note that this is a simple cryptographic validation and does not check
    # any of the actual certificate data (validity dates, extensions, names,
    # etc...)

    print('Validate Device Certificate:')
    signer_public_key.verify(
        signature=device_cert.signature,
        data=device_cert.tbs_certificate_bytes,
        signature_algorithm=ec.ECDSA(device_cert.signature_hash_algorithm)
    )
    print('OK\n')
    generate_manifest(signer_cert,device_cert)






