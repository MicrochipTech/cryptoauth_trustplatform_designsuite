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
import os

from cryptography.hazmat.backends import default_backend
from cryptography import x509
from cryptography.hazmat.primitives.serialization import Encoding
from cryptography.hazmat.primitives.asymmetric import ec
from cryptography.hazmat.primitives import hashes
from cryptoauthlib import *
from jose import jws, utils
from cryptography.hazmat.primitives import serialization

from certs_handler import *
from trustplatform import *

LOGGING_KEY = 'log_signer.key'
LOGGING_CERT = 'log_signer.crt'

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
    assert atcab_read_serial_number(serial_number) == Status.ATCA_SUCCESS
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

    print('Generating manifest file...', end='')
    for key in device_entry['publicKeySet']['keys']:
        public_key = bytearray(64)
        #print('reading slot {} public key'.format(key['kid']))
        assert atcab_get_pubkey(int(key['kid']), public_key) == Status.ATCA_SUCCESS
        key['x'] = utils.base64url_encode(public_key[0:32]).decode('ascii')
        key['y'] = utils.base64url_encode(public_key[32:64]).decode('ascii')

    # If a logging key and certificate was provided create a manifest file
    log_key, log_cert = certs_handler.load_key_and_cert(log_key_path, log_cert_path)

    # Generate the key and certificate ids for JWS
    log_key_id = certs_handler.jws_b64encode(log_cert.extensions.get_extension_for_class(x509.SubjectKeyIdentifier).value.digest)
    log_cert_id = certs_handler.jws_b64encode(log_cert.fingerprint(hashes.SHA256()))

    # Precompute the JWT header
    jws_header = {'typ': 'JWT', 'alg': 'ES256', 'kid': log_key_id, 'x5t#S256': log_cert_id}
    jws_header = certs_handler.jws_b64encode(json.dumps(jws_header).encode('ascii'))

    manifest = json.dumps([certs_handler.create_signed_entry(device_entry, log_key, jws_header)], indent=2).encode('ascii')

    filename = common_helper.make_valid_filename(device_entry['uniqueId'].upper()) + '_manifest' + '.json'
    with open(filename, 'wb') as f:
        f.write(manifest)
    print('OK (saved to {})'.format(filename))

def tflxtls_manifest(root_cert, signer_cert, device_cert):
    root_public_key = root_cert.public_key()
    print('Validate root certificate...', end='')
    root_public_key.verify(
        signature=root_cert.signature,
        data=root_cert.tbs_certificate_bytes,
        signature_algorithm=ec.ECDSA(root_cert.signature_hash_algorithm)
    )
    print('OK')
    print(certs_handler.get_cert_print_bytes(root_cert.public_bytes(encoding=Encoding.PEM)))

    signer_public_key = signer_cert.public_key()
    print('Validate signer certificate...', end='')
    root_public_key.verify(
        signature=signer_cert.signature,
        data=signer_cert.tbs_certificate_bytes,
        signature_algorithm=ec.ECDSA(signer_cert.signature_hash_algorithm)
    )
    print('OK')
    print(certs_handler.get_cert_print_bytes(signer_cert.public_bytes(encoding=Encoding.PEM)))

    print('Validate device certificate...', end='')
    signer_public_key.verify(
        signature=device_cert.signature,
        data=device_cert.tbs_certificate_bytes,
        signature_algorithm=ec.ECDSA(device_cert.signature_hash_algorithm)
    )
    print('OK')
    print(certs_handler.get_cert_print_bytes(device_cert.public_bytes(encoding=Encoding.PEM)))

    generate_manifest(signer_cert, device_cert)