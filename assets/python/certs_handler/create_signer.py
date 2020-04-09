# (c) 2018 Microchip Technology Inc. and its subsidiaries.

# Subject to your compliance with these terms, you may use Microchip software
# and any derivatives exclusively with Microchip products. It is your
# responsibility to comply with third party license terms applicable to your
# use of third party software (including open source software) that may
# accompany Microchip software.

# THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS".  NO WARRANTIES, WHETHER
# EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
# WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A PARTICULAR
# PURPOSE. IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL,
# PUNITIVE, INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY
# KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP
# HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
# FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
# ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
# THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.

from datetime import datetime, timezone
import argparse
import getpass

from cryptography import x509

from .create_certs_common import *
from .ext_builder import ExtBuilder, TimeFormat
from .create_signer_csr import add_signer_extensions


def load_or_create_signer_ca(csr_filename, cert_filename, ca_key_filename, ca_key_password, ca_cert_filename, validity=31):
    csr_filename = Path(csr_filename)
    cert_filename = Path(cert_filename)
    ca_key_filename = Path(ca_key_filename)
    ca_cert_filename = Path(ca_cert_filename)

    with open(str(csr_filename), 'rb') as f:
        csr = x509.load_pem_x509_csr(f.read(), get_backend())
    if not csr.is_signature_valid:
        raise RuntimeError('{} has invalid signature.'.format(csr_filename))

    with open(str(ca_key_filename), 'rb') as f:
        ca_private_key = serialization.load_pem_private_key(
            data=f.read(),
            password=ca_key_password,
            backend=get_backend())

    with open(str(ca_cert_filename), 'rb') as f:
        ca_certificate = x509.load_pem_x509_certificate(f.read(), get_backend())

    # Look for certificate
    certificate = None
    if cert_filename.is_file():
        # Found cached certificate file, read it in
        with open(str(cert_filename), 'rb') as f:
            certificate = x509.load_pem_x509_certificate(f.read(), get_backend())

    # Create signer certificate
    builder = ExtBuilder()
    builder = builder.issuer_name(ca_certificate.subject)
    if certificate:
        builder = builder.not_valid_before(certificate.not_valid_before)
    else:
        builder = builder.not_valid_before(
            datetime.utcnow().replace(minute=0, second=0, microsecond=0, tzinfo=timezone.utc)
        )
    builder = builder.not_valid_after(
        builder._not_valid_before.replace(year=builder._not_valid_before.year + validity),
        format=TimeFormat.GENERALIZED_TIME
    )
    builder = builder.subject_name(csr.subject)
    builder = builder.public_key(csr.public_key())
    builder = builder.serial_number(pubkey_cert_sn(16, builder))
    builder = add_signer_extensions(
        builder=builder,
        authority_cert=ca_certificate)

    # Sign signer certificate with CA
    certificate_new = builder.sign(
        private_key=ca_private_key,
        algorithm=hashes.SHA256(),
        backend=get_backend())

    certificate = update_x509_certificate(certificate, certificate_new, cert_filename, encoding='PEM')

    # return {'private_key': private_key, 'certificate': certificate}
    return {'certificate': certificate}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Create a signer certificate from its CSR')
    parser.add_argument(
        '--signer-id',
        default='FFFF',
        metavar='HexID',
        help='Signer ID to use as 4 hex digits. If omitted, FFFF will be used')
    parser.add_argument(
        '--csr',
        default='signer_FFFF.csr',
        metavar='filename',
        help='Filename for signer CSR. If omitted, signer_FFFF.csr will be used, where FFFF is the signer ID.')
    parser.add_argument(
        '--cert',
        default='signer_FFFF.der',
        metavar='filename',
        help='Filename to write the signer certificate to. If omitted, signer_FFFF.der will be used, where FFFF is the signer ID.')
    parser.add_argument(
        '--ecosystem-key',
        default='ecosystem.key',
        metavar='filename',
        help='Filename for the CA key. If omitted, ecosystem.key will be used.')
    parser.add_argument(
        '--ecosystem-cert',
        default='ecosystem.crt',
        metavar='filename',
        help='Filename for CA certificate. If omitted, ecosystem.crt will be used.')
    args = parser.parse_args()

    signer_id = args.signer_id.upper() # Signer ID must be uppercase hex
    csr_filename = signer_id.join(args.csr.rsplit('FFFF', 1)) # Replace the last instance of FFFF with the signer ID
    cert_filename = signer_id.join(args.cert.rsplit('FFFF', 1)) # Replace the last instance of FFFF with the signer ID

    ca_key_filename = Path(args.ecosystem_key)

    ca_key_password = None
    if is_key_file_password_protected(ca_key_filename):
        # Prompt for the CA key file password
        ca_key_password = getpass.getpass(prompt=('{} password:'.format(ca_key_filename.name))).encode('ascii')

    load_or_create_signer_ca(
        csr_filename=csr_filename,
        cert_filename=cert_filename,
        ca_key_filename=ca_key_filename,
        ca_key_password=ca_key_password,
        ca_cert_filename=args.ecosystem_cert)
