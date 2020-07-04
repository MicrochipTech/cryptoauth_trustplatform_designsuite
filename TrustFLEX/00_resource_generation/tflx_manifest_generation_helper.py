"""
TrustFLEX Manifest generation
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


import base64
import os
import json
from pathlib import Path
from cryptoauthlib import *
from jose import utils
from mchpcert_bckp_restore import isMCHP_cert
from certs_handler import *
from manifest_helper.tflx_manifest_helper import TFLXTLSManifest


def validate_cert_chain(root_cert, signer_cert, device_cert):
    """ Function validate the certifcate chain """
    if certs_handler.verify_cert(root_cert.public_key(), root_cert) == 'failure':
        print("validating root certificate - failed")
        return 1

    if certs_handler.verify_cert(root_cert.public_key(), signer_cert) == 'failure':
        print("validating signer certificate - failed")
        return 1

    if certs_handler.verify_cert(signer_cert.public_key(), device_cert) == 'failure':
        print("validating device certificate - failed")
        return 1

    return 0


def read_custom_cert():
    """ Function check for custom certificate in filesystem and validate the certificate in it"""
    # read deivce serial number
    ser_num = bytearray(9)
    assert atcab_read_serial_number(ser_num) == Status.ATCA_SUCCESS

    # Get the certificate path
    root_cert_path = Path('root_crt.crt')
    signer_cert_path = Path('signer_FFFF.crt')
    device_cert_path = Path('device_{}.crt'.format(base64.b16encode(ser_num).decode('ascii')))

    # Check certificate file is available
    if not (os.path.exists(root_cert_path) and os.path.exists(signer_cert_path) and os.path.exists(device_cert_path)):
        print("No valid certificates found, please run generate resources and generate certificates!")
        return {'status': 1}

    # Read root, signer and device certificate
    root_cert = read_cert(root_cert_path)
    signer_cert = read_cert(signer_cert_path)
    device_cert = read_cert(device_cert_path)

    # validate the certificate chain
    status = validate_cert_chain(root_cert, signer_cert, device_cert)
    return {
        'status': status,
        'root_cert': root_cert,
        'signer_cert': signer_cert,
        'device_cert': device_cert
    }


def load_certificate_from_device():
    """ Function return the certificates by checking whether it is MCHP or custom cert """
    # Check for MCHP certificates
    cert_info = isMCHP_cert()
    if cert_info['status'] == Status.ATCA_SUCCESS:
        status = validate_cert_chain(cert_info['root_cert'], cert_info['signer_cert'], cert_info['device_cert'])
        cert_info['status'] = status
        return cert_info
    else:
        return read_custom_cert()


def generate_tflxtls_manifest():
    """ Function encode the trustflex manifest data and generate securesigned element
    by signing manifest data and store it in manifest file """
    # Get the certificate chain
    cert_info = load_certificate_from_device()
    if cert_info['status'] != Status.ATCA_SUCCESS:
        return 'danger'

    filename = 'TFLXTLS_devices_manifest.json'
    manifest_ca_key_path = 'manifest_ca.key'
    manifest_ca_cert_path = 'manifest_ca.crt'
    print('--------------------------------------------')
    print("Generating manifest data...", end='')
    # Initializa the TFLXTLS Class
    tflx_manifest = TFLXTLSManifest()
    # set the manifest unique id and public keys
    tflx_manifest.load_manifest_uniqueid_and_keys()
    # set the device certificate provisioning time
    tflx_manifest.set_provisioning_time(cert_info['device_cert'].not_valid_before)
    # set the signer certificates and device certificates
    tflx_manifest.set_certs(cert_info['signer_cert'], cert_info['device_cert'], kid='0')
    # Encode the manifest data
    if os.path.exists(manifest_ca_key_path) and os.path.exists(manifest_ca_cert_path):
        signed_se = tflx_manifest.encode_manifest(manifest_ca_key_path, manifest_ca_cert_path)
    else:
        signed_se = tflx_manifest.encode_manifest()
    # Dump signed secure element into .json file
    tflx_manifest.write_signed_se_into_file(signed_se['signed_se'], filename)
    print('OK (saved to {})'.format(filename))
    print('--------------------------------------------')
    # print the manifest data
    # print(tflx_manifest.get_manifest())
    return 'success'
