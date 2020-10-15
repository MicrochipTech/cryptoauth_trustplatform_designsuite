from ipywidgets import widgets
from IPython.display import display
from tkinter import Tk, filedialog
import cryptography
from helper import *
from cryptography.hazmat.primitives import serialization, hashes
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.asymmetric import ec, utils
import os
from cryptoauthlib import *
import struct
import copy
from cryptography.utils import int_from_bytes, int_to_bytes
from hashlib import sha256
from cryptography.hazmat.primitives.serialization import Encoding, PublicFormat
from cryptoauthlib.device import *
from cryptoauthlib.library import ctypes_to_bytes
from cryptoauthlib.iface import *
from trustplatform import *
import binascii

ATCA_SUCCESS = 0x00
ATCA_ZONE_DATA = 0x02
ATCA_KIT_I2C_IFACE = 1

VALIDATION_AUTHORITY = "slot_13_ecc_key_pair.pem"
ROTATING_KEY = "slot_14_ecc_key_pair.pem"
rotating_key_slot = 14
authority_key_slot = 13


def calc_nonce(mode, zero, num_in, rand_out=None, temp_key=None):
    """Replicate the internal TempKey calculations of the Nonce command"""
    if mode == 0x03:
        # Passthrough mode
        if len(num_in) != 32:
            raise ValueError('num_in must be 32 bytes')
        return copy.copy(num_in)
    elif mode == 0x00 or mode == 0x01:
        # Random mode
        if len(rand_out) != 32:
            raise ValueError('rand_out must be 32 bytes')
        if len(num_in) != 20:
            raise ValueError('num_in must be 20 bytes')
        msg = b''
        msg += rand_out
        msg += num_in
        msg += b'\x16'  # Nonce Opcode
        msg += struct.pack("B", mode)
        msg += struct.pack("<H", zero)[:1]

        return sha256(msg).digest()
    else:
        raise BadArgumentError('Unsupported or invalid mode 0x{:02X}'.format(mode))


def calc_genkey_pubkey_digest(mode, key_id, public_key, temp_key, sn, other_data=None):
    """
    Replicate the internal TempKey calculations of the GenKey command in
    digest mode.
    """
    if len(public_key) != 64:
        raise ValueError('public_key must be 64 bytes')
    if len(temp_key) != 32:
        raise ValueError('temp_key must be 32 bytes')
    msg = b''
    msg += temp_key
    msg += b'\x40'  # GenKey Opcode
    if mode & 0x10:
        # Slot is storing a public key directly, use OtherData for Mode and KeyID
        if len(other_data) != 3:
            raise ValueError('other_data must be 3 bytes')
        msg += other_data
    else:
        # Slot is storing a private key and the public key is generated
        msg += struct.pack("B", mode)
        msg += struct.pack("<H", key_id)
    msg += sn[8:9]
    msg += sn[0:2]
    msg += b'\x00'*25
    msg += public_key

    return sha256(msg).digest()


def calc_sign_internal_digest(mode, key_id, temp_key, temp_key_key_id, temp_key_source_flag, temp_key_gendig_data,
                              temp_key_genkey_data, temp_key_no_mac, config, for_invalidate=False):
    """
    Replicate the internal message digest calculations of the Sign command in
    sign internal mode.
    """
    # TODO: Doesn't work for ATECC108A
    if mode & 0x80:
        raise ValueError('Invalid mode, not internal sign')
    if len(temp_key) != 32:
        raise ValueError('temp_key must be 32 bytes')
    msg = b''
    msg += temp_key
    msg += b'\x41'  # Sign Opcode
    msg += struct.pack('B', mode)
    msg += struct.pack('<H', key_id)
    msg += ctypes_to_bytes(config.SlotConfig[temp_key_key_id])
    msg += ctypes_to_bytes(config.KeyConfig[temp_key_key_id])
    temp_key_flags = 0
    if temp_key_key_id < 0 or temp_key_key_id > 15:
        raise ValueError('temp_key_key_id must be 0 to 15')
    if temp_key_gendig_data and temp_key_genkey_data:
        raise ValueError(
            'temp_key_gendig_data and temp_key_genkey_data are mutually exclusive and both can not be true'
        )
    temp_key_flags += temp_key_key_id
    temp_key_flags += (1 << 4) if temp_key_source_flag else 0
    temp_key_flags += (1 << 5) if temp_key_gendig_data else 0
    temp_key_flags += (1 << 6) if temp_key_genkey_data else 0
    temp_key_flags += (1 << 7) if temp_key_no_mac else 0
    msg += struct.pack('B', temp_key_flags)
    msg += b'\x00'*2
    is_full_sn = bool(mode & 0x40)
    sn = ctypes_to_bytes(config.SN03) + ctypes_to_bytes(config.SN48)
    msg += sn[8:9]
    msg += sn[4:8] if is_full_sn else b'\x00'*4
    msg += sn[0:2]
    msg += sn[2:4] if is_full_sn else b'\x00'*2
    msg += b'\x01' if config.SlotLocked & (1 << temp_key_key_id) else b'\x00'
    msg += b'\x01' if for_invalidate else b'\x00'
    msg += b'\x00'
    other_data = bytearray()
    other_data.extend(msg[33:43])
    other_data.extend(msg[44:48])
    other_data.extend(msg[50:55])

    return sha256(msg).digest(), other_data

def sign_host(digest, key):
    signature = key.sign(digest, ec.ECDSA(utils.Prehashed(hashes.SHA256())))
    (r,s) = utils.decode_dss_signature(signature)
    signature = int_to_bytes(r, 32) + int_to_bytes(s, 32)
    return signature

def get_rotating_key():
    with open(ROTATING_KEY, 'rb') as f:
        return serialization.load_pem_private_key(
            data=f.read(),
            password=None,
            backend=default_backend())


def get_validating_authority_key():
    with open(VALIDATION_AUTHORITY, 'rb') as f:
        return serialization.load_pem_private_key(
                data=f.read(),
                password=None,
                backend=default_backend())

def public_key_validate_invalidate(validation_status,perform_on_device=True):
    is_verified = AtcaReference(False)
    config_data = bytearray(128)
    nonce = os.urandom(32)
    public_key = bytearray(64)

    if(perform_on_device == True):
        assert atcab_read_pubkey(rotating_key_slot,public_key) == ATCA_SUCCESS
    else:
        rotating_private_key = get_rotating_key()
        public_key = rotating_private_key.public_key().public_bytes(encoding=Encoding.X962, format=PublicFormat.UncompressedPoint)[1:]

    validation_authority_key = get_validating_authority_key()

    assert ATCA_SUCCESS == atcab_read_config_zone(config_data)
    config = Atecc608Config.from_buffer(config_data)
    if(perform_on_device == True):
        assert ATCA_SUCCESS == atcab_nonce(nonce)

    nonce = calc_nonce(mode=0x03, zero=0x0000, num_in=nonce)

    pubkey_digest = calc_genkey_pubkey_digest(
        mode=0x10,
        key_id=rotating_key_slot,
        public_key=public_key,
        temp_key=nonce,
        sn=ctypes_to_bytes(config.SN03) + ctypes_to_bytes(config.SN48),
        other_data=b'\x00'*3
    )

    msg_digest,other_data = calc_sign_internal_digest(
        mode=0x00,
        key_id=authority_key_slot,
        temp_key=pubkey_digest,
        temp_key_key_id=rotating_key_slot,
        temp_key_source_flag=1,  # Device nonce in internally generated random number
        temp_key_gendig_data=False,
        temp_key_genkey_data=True,
        temp_key_no_mac=False,
        config=config,
        for_invalidate=validation_status
    )

    # Note that other_data is ignored and not required for this mode
    public_key = bytearray(64)
    if(perform_on_device == True):
        atcab_genkey_base(mode=0x10, key_id=rotating_key_slot, other_data=b'\x00'*3, public_key=public_key)


    signature = sign_host(msg_digest,validation_authority_key)

    if(perform_on_device == True):
        if(validation_status == True):
            assert atcab_verify_invalidate(rotating_key_slot,signature, other_data, is_verified) == ATCA_SUCCESS
        else:
            assert atcab_verify_validate(rotating_key_slot,signature, other_data, is_verified) == ATCA_SUCCESS
    else:
        is_verified = True
    return is_verified,nonce,signature

def public_key_validate():
    return public_key_validate_invalidate(False)[0]

def public_key_invalidate():
    return public_key_validate_invalidate(True)[0]

def resource_generate():
    validate_status,nonce,signature = public_key_validate_invalidate(False,False)
    assert validate_status == True
    application_h = 'public_key_rotation.h'
    with open(application_h, 'w') as f:
        f.write('uint8_t validated_nonce[] = {\n')
        f.write(str(common_helper.convert_to_hex_bytes(nonce)))
        f.write('};\n\n')

        f.write('uint8_t validated_signature[] = {\n')
        f.write(str(common_helper.convert_to_hex_bytes(signature)))
        f.write('};\n\n')

    validate_status,nonce,signature = public_key_validate_invalidate(True,False)
    assert validate_status == True
    with open(application_h, 'a') as f:
        f.write('uint8_t invalidated_nonce[] = {\n')
        f.write(str(common_helper.convert_to_hex_bytes(nonce)))
        f.write('};\n\n')

        f.write('uint8_t invalidated_signature[] = {\n')
        f.write(str(common_helper.convert_to_hex_bytes(signature)))
        f.write('};\n\n')
    with open(application_h, 'a') as f:
        msg_digest = os.urandom(32)
        rotating_private_key = get_rotating_key()
        signature = sign_host(msg_digest,rotating_private_key)
        f.write('uint8_t rotating_digest[] = {\n')
        f.write(str(common_helper.convert_to_hex_bytes(msg_digest)))
        f.write('};\n\n')

        f.write('uint8_t rotating_signature[] = {\n')
        f.write(str(common_helper.convert_to_hex_bytes(signature)))
        f.write('};\n\n')
        public_key = rotating_private_key.public_key().public_bytes(encoding=Encoding.X962, format=PublicFormat.UncompressedPoint)[1:]

        f.write('uint8_t public_key[] = {\n')
        f.write(str(common_helper.convert_to_hex_bytes(public_key)))
        f.write('};')

def public_key_check_validate():
    valid_buf = bytearray(4)
    assert atcab_read_zone(ATCA_ZONE_DATA, rotating_key_slot, 0, 0, valid_buf, 4) == ATCA_SUCCESS
    if(valid_buf[0] >> 4 == 0x05):
        #Already Rotating Public key slot is valided,so invalidating the slot
        assert public_key_validate_invalidate(True)[0] == 1
    resource_generate()
