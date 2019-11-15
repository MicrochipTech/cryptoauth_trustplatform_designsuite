import os
from ipywidgets import widgets
from IPython.display import display
from tkinter import Tk, filedialog
import binascii
import struct
import cryptography
from cryptoauthlib import *
from common import *
import hexrec.records as hr
import hexrec.blocks as hb
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

boot_hex = "firm_valid.hex"
app_hex = "app.hex"
key_file = "../../00_resource_generation/slot_15_ecc_key_pair.pem"

boot_start = 0x00000000
boot_end = 0x0000BFFF
app_start = 0x0000C000
app_end = 0x0003FBFF
signature_start = 0x0003FC00
app_length_start = 0x0003FD00
bparams_start = 0x0003FC00
bparams_end = 0x0003FFFF
BLOCKSIZE = 65536

# Setup cryptography
crypto_be = cryptography.hazmat.backends.default_backend()

def get_symmetric_key(file_path):
        csr_der = pem.readPemFromFile(open(file_path),
            startMarker='-----BEGIN SYMMETRIC KEY-----',
            endMarker='-----END SYMMETRIC KEY-----')
        data = bytearray()
        data.extend(csr_der[17:((csr_der[14] - 2)+17)])
        return data

    
#fill the pattern in boot    
def pattern_fill_hex(hex, firm):

    blocks = hr.load_blocks(hex)
    if ('boot' == firm):
        blocks = hb.delete(blocks, start=app_start, endex=0xFFFFFFFF)
    elif ('app' == firm):
        blocks = hb.delete(blocks, start=signature_start, endex=0xFFFFFFFF)
    blocks.sort()

    length = len(blocks)
    hex_start, hex_length = blocks[length-1]
    flooded_block = hb.flood(blocks, endex=(hex_start+len(hex_length)), pattern=b'\xFF')

    merged_block = hb.merge(flooded_block)
    return merged_block 

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

def combine_sign_hex(boot_data, app_data):
    with open(boot_hex, 'wb') as f:
        f.write(boot_data.data[0])
    f.close()    

    with open(app_hex, 'wb') as f:
        f.write(app_data.data[0])
    f.close()

    merged_boot_hex = pattern_fill_hex(boot_hex, 'boot')
    hr.save_blocks("firm_valid.hex", merged_boot_hex)
    hex_boot_start, hex_boot_length  = merged_boot_hex[0]
    print("Firmware validation binary size:", len(hex_boot_length))

    merged_app_hex = pattern_fill_hex(app_hex, 'app')
    hr.save_blocks("app.hex", merged_app_hex)
    hex_app_start, hex_app_length = merged_app_hex[0]
    print("Application binary size:", len(hex_app_length))
    
    #Merge boot hex and app hex into single hex
    blocks_boot = hr.load_blocks("firm_valid.hex")
    blocks_app = hr.load_blocks("app.hex")
    merged = blocks_boot + blocks_app
    merged.sort()

    flooded = hb.flood(merged, pattern=b'\xFF')

    flooded = hb.merge(flooded)

    hr.save_blocks("mergerd.hex", flooded)

    memory = hr.load_memory("mergerd.hex")

    #a, data = data_blocks[0]
    data = memory[boot_start:(app_start + len(hex_app_length)):b'\xFF']

    # Setup cryptography 
    crypto_be = cryptography.hazmat.backends.default_backend()

    with open(key_file, 'rb') as f:
        # Loading the private key from key_file
        private_key = serialization.load_pem_private_key(
            data=f.read(),
            password=None,
            backend=crypto_be)

    # Hashing the Application binary file bin_file
    chosen_hash = hashes.SHA256()
    hasher = hashes.Hash(chosen_hash, crypto_be)
    hasher.update(data)
    digest = hasher.finalize()

    print("\nApplication digest:")
    print(pretty_print_hex(digest, indent='    '))

    # Signing the digest of the Application binary file bin_file
    sign = private_key.sign(
            digest,
            ec.ECDSA(utils.Prehashed(chosen_hash))
    )

    # Extract actual Signature bytes 
    r_offset = (sign[3]-32)+4
    sign_r = sign[r_offset:r_offset+32]
    s_offset = (sign[r_offset+32+1]-32)+(r_offset+32+2)
    sign_s = sign[s_offset:s_offset+32]
    calc_sign = sign_r + sign_s

    print("\nSuccessfully Signed the firmware digest")
    print("Calculated signature:")
    print(str(convert_to_hex_bytes(calc_sign)))

    memory.write(0x3FC00, calc_sign)
    memory.write(0x3FD00, len(hex_app_length).to_bytes(4, byteorder='little'))
    hr.save_memory('mergerd.hex', memory)

def get_digest_signature():
    memory = hr.load_memory("mergerd.hex")
    signature = memory[signature_start:(signature_start+64):b'\xFF']
    #print("Extracted signature:")
    #print(str(convert_to_hex_bytes(signature)))

    app_length_bytes = memory[app_length_start:(app_length_start+4):b'\xFF']
    app_length = int.from_bytes(app_length_bytes, byteorder='little')
    
    data = memory[boot_start:(app_start + app_length):b'\xFF']

    # Hashing the Application binary file bin_file
    chosen_hash = hashes.SHA256()
    hasher = hashes.Hash(chosen_hash, crypto_be)
    hasher.update(data)
    digest = hasher.finalize()

    #print("\nApplication digest:")
    #print(pretty_print_hex(digest, indent='    '))

    return [digest, signature]
