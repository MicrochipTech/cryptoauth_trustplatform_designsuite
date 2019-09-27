"""
Functions to help with creating signed manifest entries
"""

import json
import os

from datetime import datetime, timezone, timedelta
from base64 import urlsafe_b64encode
from cryptography import x509
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.asymmetric import ec
from cryptography.hazmat.primitives.asymmetric import utils as crypto_utils
from cryptography.utils import int_to_bytes


def jws_b64encode(source):
    """Simple helper function to remove base64 padding"""
    return urlsafe_b64encode(source).decode('ascii').rstrip('=')


def load_or_create_key(filename):
    """Create or load a root CA key pair"""
    private_key = None
    if os.path.isfile(filename):
        # Load existing key
        with open(filename, 'rb') as f:
            private_key = serialization.load_pem_private_key(
                data=f.read(),
                password=None,
                backend=default_backend())
    if private_key is None:
        # No private key loaded, generate new one
        private_key = ec.generate_private_key(ec.SECP256R1(), default_backend())
        # Save private key to file
        with open(filename, 'wb') as f:
            pem_key = private_key.private_bytes(
                encoding=serialization.Encoding.PEM,
                format=serialization.PrivateFormat.PKCS8,
                encryption_algorithm=serialization.NoEncryption())
            f.write(pem_key)
    return private_key


def load_key_and_cert(key_file, cert_file):
    """Attemps to load a key and certificate and return the corresponding cryptography object"""
    with open(cert_file, 'rb') as f:
        cert = x509.load_pem_x509_certificate(f.read(), default_backend())

    with open(key_file, 'rb') as f:
        key = serialization.load_pem_private_key(f.read(), None, backend=default_backend())

    return key, cert


def random_cert_sn(size):
    """Create a positive, non-trimmable serial number for X.509 certificates"""
    raw_sn = bytearray(os.urandom(size))
    # Force MSB bit to 0 to ensure positive integer
    raw_sn[0] = raw_sn[0] & 0x7F
    # Force next bit to 1 to ensure the integer won't be trimmed in ASN.1 DER encoding
    raw_sn[0] = raw_sn[0] | 0x40
    return int.from_bytes(raw_sn, byteorder='big', signed=False)


def create_log_signer(log_key_path='log_signer.key', log_cert_path='log_signer.crt'):
    """
    Create a signing certificate (and key if not already created) that is used to sign manifest
    entries. This is an example as a production manifest will always be signed by a Microchip
    signing certificate.
    """

    # Create or load a root CA key pair
    print('Loading logger key')
    log_private_key = load_or_create_key(log_key_path)

    # Create root CA certificate
    print('\nGenerating self-signed logging certificate')
    builder = x509.CertificateBuilder()
    builder = builder.serial_number(random_cert_sn(16))

    name = x509.Name(
        [x509.NameAttribute(x509.oid.NameOID.ORGANIZATION_NAME, u'Example Organization'),
         x509.NameAttribute(x509.oid.NameOID.COMMON_NAME, u'Manifest Log Signer 000')])
    valid_date = datetime.utcnow().replace(tzinfo=timezone.utc)

    builder = builder.issuer_name(name)
    builder = builder.not_valid_before(valid_date)
    builder = builder.not_valid_after(valid_date + timedelta(days=365 * 25))
    builder = builder.subject_name(name)
    builder = builder.public_key(log_private_key.public_key())
    builder = builder.add_extension(
        x509.SubjectKeyIdentifier.from_public_key(log_private_key.public_key()),
        critical=False)
    builder = builder.add_extension(
        x509.BasicConstraints(ca=True, path_length=None),
        critical=True)

    # Self-sign certificate
    logger_cert = builder.sign(
        private_key=log_private_key,
        algorithm=hashes.SHA256(),
        backend=default_backend())

    log_cert_data = logger_cert.public_bytes(encoding=serialization.Encoding.PEM)

    # Write root CA certificate to file
    with open(log_cert_path, 'wb') as f:
        print('    Saving to ' + f.name)
        f.write(log_cert_data)

    return log_cert_data


def create_signed_entry(entry, log_key, jws_header):
    """
    Converts the unsigned manifest entry into the signed manifest format (divided jws)
    """
    jws_data = {'header': {'uniqueId': entry['uniqueId']}, 'protected': jws_header,
                'payload': jws_b64encode(json.dumps(entry).encode('ascii'))}

    tbs = jws_data['protected'] + '.' + jws_data['payload']

    signature = log_key.sign(tbs.encode('ascii'), ec.ECDSA(hashes.SHA256()))

    r_int, s_int = crypto_utils.decode_dss_signature(signature)

    signature = int_to_bytes(r_int, 32) + int_to_bytes(s_int, 32)

    jws_data['signature'] = jws_b64encode(signature)

    return jws_data
