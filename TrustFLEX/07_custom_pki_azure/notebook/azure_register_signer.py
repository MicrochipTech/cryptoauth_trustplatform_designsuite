from datetime import datetime, timezone, timedelta
from argparse import ArgumentParser
import re
import boto3
import botocore
from cryptography import x509
from cryptography.hazmat.primitives import hashes, serialization
from azure_kit_common import *
from pathlib import Path
import os
import subprocess
import json
import csv
import time
import binascii

SIGNER_CA = "signerCA"
signer_cert_path = os.path.join(path, "00_resource_generation", 'signer-ca.cer')
verification_cert_path = os.path.join(path, "00_resource_generation", 'azure-signer-ca-verification.cer')

azure_hub_CSV = "Azure_iot_hub_details.csv"
home_path = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.realpath(__file__)))))
AZURE_HUB_DETAILS = os.path.join(home_path, 'docs', azure_hub_CSV)


def get_org_name(name):
    """
    Get the org name string from a distinguished name (RDNSequence)
    """
    for attr in name:
        if attr.oid == x509.oid.NameOID.ORGANIZATION_NAME:
            return attr.value
    return None

def generate_verification_cert(reg_code,
        signer_ca_key_path=SIGNER_CA_KEY_FILENAME,
        signer_ca_cert_path=SIGNER_CA_CERT_FILENAME,
        signer_ca_ver_cert_path=SIGNER_CA_VER_CERT_FILENAME,
):

    # Read the signer CA key file needed to sign the verification certificate
    if not os.path.isfile(os.path.join(path, "00_resource_generation", SIGNER_CA_KEY_FILENAME)):
        raise AzureKitError('Failed to find signer CA key file, ' + SIGNER_CA_KEY_FILENAME + '. Have you run ca_create_signer_csr first?')
    with open(os.path.join(path, "00_resource_generation", SIGNER_CA_KEY_FILENAME), 'rb') as f:
        signer_ca_priv_key = serialization.load_pem_private_key(
            data=f.read(),
            password=None,
            backend=crypto_be)

    # Read the signer CA certificate to be registered with Azure IoT
    if not os.path.isfile(os.path.join(path, "00_resource_generation", SIGNER_CA_CERT_FILENAME)):
        raise AzureKitError('Failed to find signer CA certificate file, ' + SIGNER_CA_CERT_FILENAME + '. Have you run ca_create_signer first?')
    with open(os.path.join(path, "00_resource_generation", SIGNER_CA_CERT_FILENAME), 'rb') as f:
        signer_ca_cert = x509.load_pem_x509_certificate(f.read(), crypto_be)

    # Request a registration code required for registering a CA certificate (signer)
    # Generate a verification certificate around the registration code (subject common name)
    builder = x509.CertificateBuilder()
    builder = builder.serial_number(random_cert_sn(16))
    builder = builder.issuer_name(signer_ca_cert.subject)
    builder = builder.not_valid_before(datetime.utcnow().replace(tzinfo=timezone.utc))
    builder = builder.not_valid_after(builder._not_valid_before + timedelta(days=1))
    builder = builder.subject_name(x509.Name([x509.NameAttribute(x509.oid.NameOID.COMMON_NAME, reg_code)]))
    builder = builder.public_key(signer_ca_cert.public_key())
    signer_ca_ver_cert = builder.sign(
        private_key=signer_ca_priv_key,
        algorithm=hashes.SHA256(),
        backend=crypto_be)


    # Write signer CA certificate to file for reference
    with open(os.path.join(path, "00_resource_generation", 'azure-signer-ca-verification.cer'), 'wb') as f:
        f.write(signer_ca_ver_cert.public_bytes(encoding=serialization.Encoding.PEM))




def register_azure_signer():

    with open(AZURE_HUB_DETAILS, mode='r') as csv_file:
        csv_reader = csv.DictReader(csv_file)
        for row in csv_reader:
            hub_name = row["IoT Hub"]
    if hub_name == 'replace_your_host_name_here':
        print('Configure the file {} in docs folder with your azure iot hub name before proceeding'.format(azure_hub_CSV))
        return False
    print("Checking if the signer is already uploaded to iot hub...")
    cert_check =  subprocess.check_output('az iot hub certificate list --hub-name ' + hub_name + ' --query value[].properties[].thumbprint ' ,universal_newlines=True, shell=True)
    signer_cert_finger = re.findall(r'"(.*?)"', cert_check)

    with open(signer_cert_path, 'rb') as f:
        cert = x509.load_pem_x509_certificate(f.read(), crypto_be)
        fingerprint = binascii.hexlify(cert.fingerprint(hashes.SHA1())).decode().upper()

    for x in signer_cert_finger:
        if(x == fingerprint):
            print("Signer already exist in Azure IOT Hub....proceed for Register device step\r\n")
            return None

    ## Getting signer org name from the signer certificate
    signer_org_name = get_org_name(cert.subject).strip().replace(" ", "_")

    print("Signer ca uploading to the hub started...")
    signer_name =  SIGNER_CA + '_' + signer_org_name + '_' + datetime.now().strftime("%Y-%m-%d-%H-%M-%S")

    ## Signer Certificate Upload   ##
    subprocess.call('az iot hub certificate create --hub-name ' + hub_name + ' --name ' + signer_name  + ' --path ' + signer_cert_path , shell=True)

    print("Getting the verification code from the iot hub...")
    # Generate Verification Code ##
    etag_id = subprocess.check_output('az iot hub certificate show --hub-name ' + hub_name + ' --name ' + signer_name  + ' --query etag',universal_newlines=True, shell=True)

    data = subprocess.check_output('az iot hub certificate generate-verification-code --hub-name ' + hub_name + ' --name ' + signer_name  + ' --etag '+ etag_id +' --query properties.verificationCode',universal_newlines=True, shell=True)
    json_data = json.loads(data)
    registration_code = json_data['properties']['verificationCode']

    print("Generating the verification certificate with verification code...")
    generate_verification_cert(registration_code, SIGNER_CA_KEY_FILENAME, SIGNER_CA_CERT_FILENAME, SIGNER_CA_VER_CERT_FILENAME)

    etag_id = subprocess.check_output('az iot hub certificate show --hub-name ' + hub_name + ' --name ' + signer_name  + '  --query etag',universal_newlines=True, shell=True)

    print("Uploading the verification certificate to iot hub...")
    ## Upload the Verification certificate ##
    subprocess.check_output('az iot hub certificate verify --hub-name ' + hub_name + ' --name ' + signer_name  + ' --path ' + verification_cert_path + ' --etag ' + etag_id,universal_newlines=True, shell=True)
    print("Signer ca {} uploaded and verified in azure hub\r\n".format(signer_name))
    return True

def register_device(device_id):
    with open(AZURE_HUB_DETAILS, mode='r') as csv_file:
        csv_reader = csv.DictReader(csv_file)
        for row in csv_reader:
            hub_name = row["IoT Hub"]

    ## Checking if the azure iot hub name is proper in the credentials file ##
    if hub_name == 'replace_your_host_name_here':
        print('Configure the file {} in docs folder with your azure iot hub name before proceeding'.format(azure_hub_CSV))
        return False

    print("Registering DeviceID started....")

    ## Checking if the Device ID is already uploaded to the azure iot hub ##
    device_check =  subprocess.check_output('az iot hub device-identity list --hub-name ' + hub_name + ' --query [].deviceId ' ,universal_newlines=True, shell=True)

    device_check_id = re.findall(r'"(.*?)"', device_check)
    for x in device_check_id:
        if(x == device_id):
            print("Device ID {} already registered in azure hub\r\n".format(device_id))
            return True

    ## Registring the Device ID to the azure iot hub ##
    subprocess.call('az iot hub device-identity create -n ' + hub_name + ' -d ' + device_id  + ' --am x509_ca ' , shell=True)
    print("Device ID {} registered to azure hub\r\n".format(device_id))
    return True

def azure_account_login():
    subprocess.check_output('az login', shell=True)
