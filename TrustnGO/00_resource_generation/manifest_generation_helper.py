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

import os, subprocess
import unicodedata
import re
from cryptography.hazmat.primitives.serialization import Encoding, PublicFormat
from cryptography.utils import int_from_bytes
from cryptoauthlib import *
from common import *
from jose import utils

from manifest_signing_helper import *


ATCA_SUCCESS = Status.ATCA_SUCCESS


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


def tng_data(log_key_path='log_signer.key', log_cert_path='log_signer.crt'):
    """Read the TNG keys and certificate chains from the device."""

    certs = []

    print('Root Certificate:')
    root_cert_der_size = AtcaReference(0)
    assert tng_atcacert_root_cert_size(root_cert_der_size) == ATCA_SUCCESS

    root_cert_der = bytearray(root_cert_der_size.value)
    assert tng_atcacert_root_cert(root_cert_der, root_cert_der_size) == ATCA_SUCCESS

    root_cert = x509.load_der_x509_certificate(root_cert_der, default_backend())
    certs.insert(0, root_cert)

    with open('temp_crt', 'wb') as f:
        f.write(root_cert.public_bytes(encoding=Encoding.PEM))
    show_configure_str = 'openssl x509 -in temp_crt -text'
    print(subprocess.check_output(show_configure_str,universal_newlines=True, shell=True))
    os.remove('temp_crt')

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

    print('Validate Root Certificate:')
    root_public_key.verify(
        signature=root_cert.signature,
        data=root_cert.tbs_certificate_bytes,
        signature_algorithm=ec.ECDSA(root_cert.signature_hash_algorithm)
    )
    print('OK\n')

    print('Signer Certificate:')
    signer_cert_der_size = AtcaReference(0)
    assert tng_atcacert_max_signer_cert_size(signer_cert_der_size) == ATCA_SUCCESS

    signer_cert_der = bytearray(signer_cert_der_size.value)
    assert tng_atcacert_read_signer_cert(signer_cert_der, signer_cert_der_size) == ATCA_SUCCESS

    signer_cert = x509.load_der_x509_certificate(signer_cert_der, default_backend())
    certs.insert(0, signer_cert)

    with open('temp_crt', 'wb') as f:
        f.write(signer_cert.public_bytes(encoding=Encoding.PEM))
    show_configure_str = 'openssl x509 -in temp_crt -text'
    print(subprocess.check_output(show_configure_str,universal_newlines=True, shell=True))
    os.remove('temp_crt')

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
    print('Validate Signer Certificate:')
    root_public_key.verify(
        signature=signer_cert.signature,
        data=signer_cert.tbs_certificate_bytes,
        signature_algorithm=ec.ECDSA(signer_cert.signature_hash_algorithm)
    )
    print('OK\n')

    print('Device Certificate:')
    device_cert_der_size = AtcaReference(0)
    assert tng_atcacert_max_device_cert_size(device_cert_der_size) == ATCA_SUCCESS

    device_cert_der = bytearray(device_cert_der_size.value)
    assert tng_atcacert_read_device_cert(device_cert_der, device_cert_der_size) == ATCA_SUCCESS

    device_cert = x509.load_der_x509_certificate(device_cert_der, default_backend())
    certs.insert(0, device_cert)

    with open('temp_crt', 'wb') as f:
        f.write(device_cert.public_bytes(encoding=Encoding.PEM))
    show_configure_str = 'openssl x509 -in temp_crt -text'
    print(subprocess.check_output(show_configure_str,universal_newlines=True, shell=True))
    os.remove('temp_crt')

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

    print('Validate Device Certificate:')
    signer_public_key.verify(
        signature=device_cert.signature,
        data=device_cert.tbs_certificate_bytes,
        signature_algorithm=ec.ECDSA(device_cert.signature_hash_algorithm)
    )
    print('OK\n')
    print('------------------------------------------------------')
	
    device_entry = {
        'version': 1,
        'model': 'ATECC608A',
        'partNumber': 'ATECC608A-TNGTLS',
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

    device_entry['provisioningTimestamp'] = device_cert.not_valid_before.strftime('%Y-%m-%dT%H:%M:%S.%f')[:-3] + 'Z'

    serial_number = bytearray(9)
    assert atcab_read_serial_number(serial_number) == ATCA_SUCCESS
    device_entry['uniqueId'] = serial_number.hex()

    device_entry['publicKeySet'] = {
        'keys': [
            {
                'kid': '0',
                'kty': 'EC',
                'crv': 'P-256',
                'x': None,
                'y': None,
                'x5c': [
                    base64.b64encode(device_cert_der).decode('ascii'),
                    base64.b64encode(signer_cert_der).decode('ascii')
                ]
            },
            {'kid': '1', 'kty': 'EC', 'crv': 'P-256', 'x': None, 'y': None},
            {'kid': '2', 'kty': 'EC', 'crv': 'P-256', 'x': None, 'y': None},
            {'kid': '3', 'kty': 'EC', 'crv': 'P-256', 'x': None, 'y': None},
            {'kid': '4', 'kty': 'EC', 'crv': 'P-256', 'x': None, 'y': None}
        ]
    }

    for key in device_entry['publicKeySet']['keys']:
        public_key = bytearray(64)
        #print('reading slot {} public key'.format(key['kid']))
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
    print('Generated the manifest file ' + filename)

    return manifest, filename

