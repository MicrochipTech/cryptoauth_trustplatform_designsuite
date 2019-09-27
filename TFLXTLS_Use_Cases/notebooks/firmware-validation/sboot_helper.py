import os
from ipywidgets import widgets
from IPython.display import display
from tkinter import Tk, filedialog
import cryptography
from cryptoauthlib import *
from common import *
from cryptography.hazmat.primitives import serialization, hashes
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.asymmetric import ec, utils
from pyasn1_modules import pem

# General Cryptoauthlib Macros
LOCK_ZONE_CONFIG = 0x00
LOCK_ZONE_DATA = 0x01
LOCK_ZONE_NO_CRC = 0x80
LOCK_ZONE_CONFIG = 0x00
ATCA_ZONE_CONFIG = 0x00
ATCA_ZONE_DATA = 0x02
ATCA_SUCCESS = 0x00
ATCA_KEY_SIZE = 32
IO_PROTECTION_KEY_SLOT = 6
SECUREBOOT_PUBLIC_KEY = 15

# Configuration modes available for Secureboot
SECUREBOOTCONFIG_MODE_FULL_BOTH = 0x01
SECUREBOOTCONFIG_MODE_FULL_SIG = 0x02
SECUREBOOTCONFIG_MODE_FULL_DIG = 0x03

# Command modes available for Secureboot
SECUREBOOT_MODE_FULL = 0x05
SECUREBOOT_MODE_FULL_STORE = 0x06
SECUREBOOT_MODE_FULL_COPY = 0x07

# Setup cryptography
crypto_be = cryptography.hazmat.backends.default_backend()

def get_symmetric_key(file_path):
        csr_der = pem.readPemFromFile(open(file_path),
            startMarker='-----BEGIN SYMMETRIC KEY-----',
            endMarker='-----END SYMMETRIC KEY-----')
        data = bytearray()
        data.extend(csr_der[17:((csr_der[14] - 2)+17)])
        return data

def program_public_key(b):
    # loading keyfile and programming public key into ECC608A device.,
    key_path = SelectFileDialog("Select public key file", "Key file", "*.pem")
    if key_path==None:
        raise ValueError("No file chosen")
    else:
        print("Selected key file is", os.path.basename(key_path))

    # Get hid default config and set device type
    cfg = cfg_ateccx08a_kithid_default()
    cfg.devtype = get_device_type_id('ATECC608A')

    # Initialize interface
    assert atcab_init(cfg) == ATCA_SUCCESS

    # Get connected device type
    info = bytearray(4)
    assert atcab_info(info) == ATCA_SUCCESS
    dev_type = get_device_type_id(get_device_name(info))

    # Checking if the connected device matches with selected device
    if dev_type != cfg.devtype:
        assert atcab_release() == ATCA_SUCCESS
        raise ValueError('Device not supported')

    print("Device initialization - Successfull")

    with open(key_path, 'rb') as f:
    # Load the public key from key file
        priv_key = serialization.load_pem_private_key(
        data=f.read(),
        password=None,
        backend=default_backend())
    public_key = priv_key.public_key().public_numbers().encode_point()[1:]

    public_key_slot_data = bytearray(4) + public_key[0:32] + bytearray(4) + public_key[32:64]

    #write secure boot public key to crypto device
    assert atcab_write_bytes_zone(ATCA_ZONE_DATA, SECUREBOOT_PUBLIC_KEY, 0, public_key_slot_data, 72) == ATCA_SUCCESS

    print('Secureboot Public Key is loaded!!!')





