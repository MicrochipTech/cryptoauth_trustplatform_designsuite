import re
import binascii
import sys, os
import csv
import json
from base64 import b64decode
from jose import jws
from jose.utils import base64url_decode, base64url_encode
from cryptography import x509
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.serialization import Encoding, PublicFormat
from datetime import datetime
from pathlib import Path
from trustplatform import sys_helper
from certs_handler import *

path = Path(os.getcwd()).parent.parent.parent.parent
crypto_be = cryptography.hazmat.backends.default_backend()

azure_hub_CSV = "Azure_iot_hub_details.csv"
AZURE_HUB_DETAILS = os.path.join(path, 'docs', azure_hub_CSV)
hub_name = 'replace_your_host_name_here'
sub_id = 'replace_your_subscription_id_here'
SIGNER_CA_FILENAME_BASE = 'signer_FFFF'

def get_device_cert_from_manifest(mchp_manifest, public_key_slot, signer_cert_pem=None):
    certs = []
    signer_cert = None

    if signer_cert_pem is not None:
        signer_cert = x509.load_pem_x509_certificate(signer_cert_pem, default_backend())

        # Validate the log signer certificate validity period
        now = datetime.utcnow()
        if now < signer_cert.not_valid_before or now > signer_cert.not_valid_after:
            raise ValueError('Log signer certificate has expired.')

        # Convert certificate public key into PEM format for jws api
        public_key_pem = signer_cert.public_key().public_bytes(
            encoding=Encoding.PEM,
            format=PublicFormat.SubjectPublicKeyInfo
        ).decode('ascii')

        ext = signer_cert.extensions.get_extension_for_class(x509.SubjectKeyIdentifier)
        kid = base64url_encode(ext.value.digest).decode('ascii')
        x5t_s256 = base64url_encode(signer_cert.fingerprint(hashes.SHA256())).decode('ascii')

    for raw_entry in mchp_manifest:
        if signer_cert:
            # Validate and decode signed entry
            jws_compact = '.'.join([raw_entry['protected'], raw_entry['payload'], raw_entry['signature']])
            entry = json.loads(
                jws.verify(
                    token=jws_compact,
                    key=public_key_pem,
                    algorithms=['ES256']
                )
            )
            protected = json.loads(base64url_decode(raw_entry['protected'].encode('ascii')))
            if protected['kid'] != kid:
                print('kid does not match value calculated from certificate')
                continue

            if protected['x5t#S256'] != x5t_s256:
                print('x5t#S256 does not match value calculated from certificate')
                continue

            if raw_entry['header']['uniqueId'] != entry['uniqueId']:
                print('uniqueId in unprotected header does not match value in payload')
                continue
        else:
            entry = json.loads(base64url_decode(raw_entry['protected']))

        # Search public key list for the auth public key specified
        auth_public_key = None
        public_keys = entry.get('publicKeySet', {}).get('keys', [])
        for public_key in public_keys:
            if public_key.get('kid', None) == str(public_key_slot):
                auth_public_key = public_key
                break
        if auth_public_key is None:
            print('Auth public key slot {} not found.'.format(public_key_slot))
            continue

        if auth_public_key.get('kty', None) != 'EC' or auth_public_key.get('crv', None) != 'P-256':
            print('Unsupported public key type for ZTP-EAP format')
            continue

        if not auth_public_key.get('x5c', []):
            print('Device cert not found in Manifest file')
            continue
        certs.append(x509.load_der_x509_certificate(b64decode(auth_public_key['x5c'][0]), default_backend()))
    return certs

def register_device(manifest_data, validation_cert):
    print("\nRegistering DeviceID started....")
    #Extrat device ID and Finger print to register
    verification_cert = x509.load_pem_x509_certificate(data=validation_cert, backend=default_backend())
    device_cert_list = get_device_cert_from_manifest(manifest_data, 0, validation_cert)

    ## Checking if the Device ID is already uploaded to the azure iot hub ##
    print("\tFetching list of device registered....", end='')
    subProcessOut = sys_helper.run_subprocess_cmd(cmd=["az", "iot", "hub", "device-identity", "list", "--hub-name", hub_name, "--query", "[].deviceId"], sys_newlines=True, sys_shell = True)
    if subProcessOut.returncode != 0:
        print("Getting device identity failed\r\n")
        return 'danger'
    device_check = subProcessOut.stdout
    device_check_id = re.findall(r'"(.*?)"', device_check)
    print('OK')

    for device_cert in device_cert_list:
        device_id = device_cert.subject.get_attributes_for_oid(x509.oid.NameOID.COMMON_NAME)[0].value
        print("\tRegistering Device ID {}...".format(device_id), end='')
        if device_id in device_check_id:
            print("already registered.")
            continue

        ## Registring the Device ID to the azure iot hub ##
        primary_thumbprint = str(binascii.hexlify(device_cert.fingerprint(hashes.SHA1())), 'utf-8').upper()
        secondary_thumbprint = primary_thumbprint

        subProcessOut = sys_helper.run_subprocess_cmd(cmd=["az", "iot", "hub", "device-identity", "create", "-n", hub_name, "-d", device_id, "--am", "x509_thumbprint", "--ptp", primary_thumbprint, "--stp", secondary_thumbprint], sys_newlines=True, sys_shell=True)

        if subProcessOut.returncode != 0:
            print("Registering device identity failed\r\n")
            return 'danger'
        print('OK')
    print('Completed registering device.')

    return 'success'

##Azure account login
def azure_account_login():
    subProcessOut = sys_helper.run_subprocess_cmd(cmd=["az", "login"], sys_shell = True)
    if subProcessOut.returncode != 0:
        print("Login failed")
        return 'danger'

    print('Extract credentials from csv file...', end='')
    with open(AZURE_HUB_DETAILS, mode='r') as csv_file:
        csv_reader = csv.DictReader(csv_file)
        for row in csv_reader:
            global hub_name, sub_id
            hub_name = row["IoT Hub"]
            sub_id = row["Subscription ID"]
    print('OK')
    print('Azure Hostname: {}.azure-devices.net'.format(hub_name))
    print('Azure Subscription ID: {}'.format(sub_id.upper()))

    ## Checking if the azure iot hub name is proper in the credentials file ##
    if hub_name == 'replace_your_host_name_here':
        print('Configure the file {} in docs folder with your azure iot hub name before proceeding\r\n'.format(azure_hub_CSV))
        return 'danger'

    ## Checking if the azure iot hub Subscription id is proper in the credentials file ##
    if sub_id == 'replace_your_subscription_id_here':
        print('Configure the file {} in docs folder with your azure iot hub Subscription ID before proceeding\r\n'.format(azure_hub_CSV))
        return 'danger'

    print("Setting the Subscription ID....", end='')
    subProcessOut = sys_helper.run_subprocess_cmd(cmd=["az", "account", "set", "--subscription", sub_id], sys_newlines=True, sys_shell = True)
    if subProcessOut.returncode != 0:
        print("Invalid Subscription ID. Make sure the Subscription ID in {} is same as in Azure iot hub".format(azure_hub_CSV))
        return 'danger'
    print('OK')
    return 'success'
