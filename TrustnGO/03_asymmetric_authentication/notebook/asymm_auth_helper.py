from certs_handler import *
from trustplatform import *


def rebuild_cert():
    print('Read root certificate from host...', end='')
    root_cert_der_size = AtcaReference(0)
    tng_atcacert_root_cert_size(root_cert_der_size)
    root_cert_der = bytearray(root_cert_der_size.value)
    try:
        assert tng_atcacert_root_cert(root_cert_der, root_cert_der_size) == CertStatus.ATCACERT_E_SUCCESS
    except:
        print('Read root certificate from host failed', end='')
        return 'danger'
    tng_root_cert = x509.load_der_x509_certificate(root_cert_der, default_backend())
    print('OK\r\n')
    print(certs_handler.get_cert_print_bytes(tng_root_cert.public_bytes(encoding=Encoding.PEM)))
    print('------------------------------------------------------\n')

    print('Read signer certificate from device...', end='')
    signer_cert_der_size = AtcaReference(0)
    tng_atcacert_max_signer_cert_size(signer_cert_der_size)
    signer_cert_der = bytearray(signer_cert_der_size.value)
    try:
        assert tng_atcacert_read_signer_cert(signer_cert_der, signer_cert_der_size) == CertStatus.ATCACERT_E_SUCCESS
    except:
        print('Read signer certificate from device failed', end='')
        return 'danger'
    tng_signer_cert = x509.load_der_x509_certificate(signer_cert_der, default_backend())
    print('OK\r\n')
    print(certs_handler.get_cert_print_bytes(tng_signer_cert.public_bytes(encoding=Encoding.PEM)))
    print('------------------------------------------------------\n')

    print('Read device certificate from device...', end='')
    device_cert_der_size = AtcaReference(0)
    tng_atcacert_max_device_cert_size(device_cert_der_size)
    device_cert_der = bytearray(device_cert_der_size.value)
    try:
        assert tng_atcacert_read_device_cert(device_cert_der, device_cert_der_size) == CertStatus.ATCACERT_E_SUCCESS
    except:
        print('Read device certificate from device failed', end='')
        return 'danger'
    tng_device_cert = x509.load_der_x509_certificate(device_cert_der, default_backend())
    print('OK\r\n')
    print(certs_handler.get_cert_print_bytes(tng_device_cert.public_bytes(encoding=Encoding.PEM)))
    print('------------------------------------------------------\n')
    return tng_root_cert, tng_signer_cert, tng_device_cert

def verify_cert_chain(tng_root_cert, tng_signer_cert, tng_device_cert):
    root_pub_key_raw = bytearray(64)
    try:
        assert tng_atcacert_root_public_key(root_pub_key_raw) == CertStatus.ATCACERT_E_SUCCESS
    except:
        print('Reading root public key failed', end='')
        return 'danger'

    if certs_handler.verify_cert(root_pub_key_raw, tng_root_cert) == 'failure':
        print('Root certificate is not validated against Root CA public key\n')
        return 'danger'

    print('\tVerifying root certificate.....OK')

    signer_pub_key_raw = bytearray(64)
    try:
        assert tng_atcacert_signer_public_key(signer_pub_key_raw) == CertStatus.ATCACERT_E_SUCCESS
    except:
        print('Reading signer public key failed', end='')
        return 'danger'

    if certs_handler.verify_cert(root_pub_key_raw, tng_signer_cert) == 'failure':
        print('Signer certificate is not validated against Root CA public key\n')
        return 'danger'

    print('\tVerifying signer certificate...OK')

    if certs_handler.verify_cert(signer_pub_key_raw, tng_device_cert) == 'failure':
        print('Device certificate is not validated against signer public key\n')
        return 'danger'

    print('\tVerifying device certificate...OK')
    print('------------------------------------------------------')

