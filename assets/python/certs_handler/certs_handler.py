import json
import os
import sys
from base64 import b16encode
from OpenSSL import crypto
from cryptography.hazmat.primitives.serialization import Encoding, PublicFormat

from datetime import datetime, timezone, timedelta
from base64 import urlsafe_b64encode
from cryptography import x509
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.asymmetric import ec
from cryptography.hazmat.primitives.asymmetric import utils as crypto_utils
from cryptography.utils import int_to_bytes, int_from_bytes

from .create_root import *
from .create_cert_defs import *
from .create_device_template import *
from .create_signer_csr import *
from .create_signer import *
from .create_certs_common import *

class certs_handler():
    """
    Class with methods which help with wrappers and
    helpers for modules like python sys, path, subprocess
    """
    root_org_name='Microchip Technology Inc'
    root_common_name='Crypto Authentication Root CA 002'

    signer_org_name=root_org_name
    signer_common_name='Crypto Authentication Signer '
    signer_validity=20

    device_org_name=root_org_name
    device_validity=28

    def __init__(self):
        pass

    def set_root_user_data(org_name=root_org_name, common_name=root_common_name):
        certs_handler.root_org_name = org_name
        certs_handler.root_common_name = common_name
    def set_signer_user_data(org_name=signer_org_name, common_name=signer_common_name,
        validity=signer_validity):
        certs_handler.signer_org_name = org_name
        certs_handler.signer_common_name = common_name
        certs_handler.signer_validity = validity
    def set_device_user_data(org_name=device_org_name, validity=device_validity):
        certs_handler.device_org_name = org_name
        certs_handler.device_validity = validity

    def create_trust_chain(root_key_path, root_cert_path, signer_id, signer_key_path, signer_cert_path, device_cert_path):
        signer_csr = os.path.splitext(signer_key_path)[0] + '.csr'
        load_or_create_root_ca(root_key_path, root_cert_path, certs_handler.root_org_name, certs_handler.root_common_name)
        load_or_create_signer_csr(signer_id, signer_key_path, signer_csr, certs_handler.signer_org_name, certs_handler.signer_common_name)
        load_or_create_signer_ca(signer_csr, signer_cert_path, root_key_path, None, root_cert_path, certs_handler.signer_validity)
        load_or_create_device(None, None, device_cert_path, signer_key_path, None, signer_cert_path,certs_handler.device_org_name, certs_handler.device_validity)

    def generate_cert_def_files(root_cert_path, signer_id, signer_cert_path, device_cert_path):
        signer_cert_def = create_signer_cert_def(cert=read_cert(signer_cert_path),template_id=1,chain_id=0,signer_id=signer_id)
        signer_files = create_cert_def_c_files(cert_def=signer_cert_def,chain_level=1,ca_cert=read_cert(root_cert_path))
        for file_name, file_data in signer_files.items():
            Path(file_name).write_bytes(file_data)
            if file_name[-2:] == '.h':
                signer_include_filename = file_name
                match = re.search(r'atcacert_def_t\s+([a-zA-Z0-9_]+)', file_data.decode('utf-8'))
                signer_cert_def_var_name = match.group(1)

        device_cert_def = create_device_cert_def(cert=read_cert(device_cert_path),template_id=2,chain_id=0,signer_id=signer_id,
            serial_num='012301020304050601',signer_cert_def=signer_cert_def)
        device_files = create_cert_def_c_files(cert_def=device_cert_def,chain_level=0,ca_include_filename=signer_include_filename,
            ca_cert_def_var_name=signer_cert_def_var_name)
        for file_name, file_data in device_files.items():
            Path(file_name).write_bytes(file_data)
        return signer_cert_def, device_cert_def

    def build_device_cert(serial_num, public_key, signer_key_path, signer_cert_path, device_cert_path):
        device_cert = load_or_create_device(
            serial_num=b16encode(serial_num).decode('ascii'),
            public_key_hex=b16encode(public_key).decode('ascii'),
            cert_filename=device_cert_path,
            ca_key_filename=signer_key_path,
            ca_key_password=None,
            ca_cert_filename=signer_cert_path,
            org_name=certs_handler.device_org_name,
            validity=certs_handler.device_validity
        )['certificate']
        return device_cert

    def get_cert_content(certificate):
        """
        Function return certificate in TEXT format
        Inputs:
                certificate             Contains certificate in PEM format

        Outputs:
                cert_content            Contains certificate in TEXT format
        """
        cert_object = crypto.load_certificate(crypto.FILETYPE_PEM, certificate)
        cert_content = crypto.dump_certificate(crypto.FILETYPE_TEXT, cert_object)
        return cert_content

    def get_cert_print_bytes(cert):
        """
        Function return string contains certificate PEM + TEXT format
        Inputs:
                cert                  Contains certificate in PEM or bytes format

        Outputs:
                cert_bytes            Contains certificate in PEM + TEXT format
        """
        #collect PEM bytes
        cert_bytes = cert.decode("utf-8")
        cert_bytes += '\n'

        #collect certificate text
        cert_bytes += certs_handler.get_cert_content(cert).decode("utf-8")
        cert_bytes += '\n'

        #contains both PEM and certificate text
        return cert_bytes

    def read_kit_info(kit_info_file_name='kit-info.json'):
        if not os.path.isfile(kit_info_file_name):
            return {}
        with open(kit_info_file_name, 'r') as f:
            json_str = f.read()
            if not json_str:
                return {}  # Empty file
            return json.loads(json_str)

    def save_kit_info(kit_info, kit_info_file_name='kit-info.json'):
        with open(kit_info_file_name, 'w') as f:
            f.write(json.dumps(kit_info, indent=4, sort_keys=True))

    def jws_b64encode(source):
        """Simple helper function to remove base64 padding"""
        return urlsafe_b64encode(source).decode('ascii').rstrip('=')

    def load_key_and_cert(key_file, cert_file):
        """Attemps to load a key and certificate and return the corresponding cryptography object"""
        with open(cert_file, 'rb') as f:
            cert = x509.load_pem_x509_certificate(f.read(), default_backend())
        with open(key_file, 'rb') as f:
            key = serialization.load_pem_private_key(f.read(), None, backend=default_backend())

        return key, cert

    def get_public_key(key_file):
        with open(key_file, 'rb') as f:
            key = serialization.load_pem_private_key(f.read(), None, backend=default_backend())
        return key.public_key().public_numbers().encode_point()[1:]

    def create_manifest_log_signer(log_key_path='log_signer.key', log_cert_path='log_signer.crt'):
        """
        Create a signing certificate (and key if not already created) that is used to sign manifest
        entries. This is an example as a production manifest will always be signed by a Microchip
        signing certificate.
        """
        print('------------- Creating Manifest Log Signer ----------- ')
        # Create or load a root CA key pair
        print('Loading Manifest logger key')
        log_private_key = load_or_create_key_pair(log_key_path)

        # Create root CA certificate
        print('Generating self-signed logging certificate')
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

        print('------------------------------------------------------')
        return log_cert_data

    def create_signed_entry(entry, log_key, jws_header):
        """
        Converts the unsigned manifest entry into the signed manifest format (divided jws)
        """
        jws_data = {'header': {'uniqueId': entry['uniqueId']}, 'protected': jws_header,
                    'payload': certs_handler.jws_b64encode(json.dumps(entry).encode('ascii'))}

        tbs = jws_data['protected'] + '.' + jws_data['payload']

        signature = log_key.sign(tbs.encode('ascii'), ec.ECDSA(hashes.SHA256()))
        r_int, s_int = crypto_utils.decode_dss_signature(signature)
        signature = int_to_bytes(r_int, 32) + int_to_bytes(s_int, 32)

        jws_data['signature'] = certs_handler.jws_b64encode(signature)

        return jws_data

    def verify_cert(pub_key_raw, cert):
       """
       """
       public_key = ec.EllipticCurvePublicNumbers(
           curve=ec.SECP256R1(),
           x=int_from_bytes(pub_key_raw[0:32], byteorder='big'),
           y=int_from_bytes(pub_key_raw[32:64], byteorder='big'),
       ).public_key(default_backend())

       try:
          public_key.verify(
              signature=cert.signature,
              data=cert.tbs_certificate_bytes,
              signature_algorithm=ec.ECDSA(cert.signature_hash_algorithm)
         )
       except ValueError:
          return 'failure'

       return 'success'