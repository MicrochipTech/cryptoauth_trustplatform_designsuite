from certs_handler import *
from trustplatform import *


def rebuild_cert(root_cert_object, signer_cert_object, device_cert_object):
   try:
      root_cert_path = list(root_cert_object.value)[0]
      signer_cert_path = list(signer_cert_object.value)[0]
      device_cert_path = list(device_cert_object.value)[0]
   except:
      print('Error in File selection.. Reselect certificate files')
      return

   #Load certificate from file selected
   is_root_file_extn_valid = '.crt' in root_cert_path
   assert is_root_file_extn_valid, 'Its required to select .crt for certification chain verification.'
   with open(root_cert_path, 'wb') as f:
      f.write(root_cert_object.data[0])

   is_signer_file_extn_valid = '.crt' in signer_cert_path
   assert is_signer_file_extn_valid, 'Its required to select .crt for certification chain verification.'
   with open(signer_cert_path, 'wb') as f:
      f.write(signer_cert_object.data[0])

   is_device_file_extn_valid = '.crt' in device_cert_path
   assert is_device_file_extn_valid, 'Its required to select .crt for certification chain verification.'
   if not 'template' in device_cert_path:
      print('Device cert template must be selected, select device_template.crt from resource generation')
      return
   with open(device_cert_path, 'wb') as f:
      f.write(device_cert_object.data[0])

   #hardcoded to match with TrustPlatform generated certificates
   signer_id = 'FFFF'

   print('Generate cert def files...', end='')
   signer_cert_def, device_cert_def = certs_handler.generate_cert_def_files(
      root_cert_path, signer_id, signer_cert_path, device_cert_path)
   print('OK')
   print('------------------------------------------------------\n')

   print('Read root certificate from host...', end='')
   root_cert = read_cert(root_cert_path)
   print('OK')
   print(certs_handler.get_cert_print_bytes(root_cert.public_bytes(encoding=Encoding.PEM)))
   print('Extract root public key...', end='')
   signer_ca_pub_key = root_cert.public_key().public_bytes(format=serialization.PublicFormat.UncompressedPoint,
      encoding=serialization.Encoding.X962)[1:]
   print('OK (Public Key: {})'.format(signer_ca_pub_key.hex().upper()))
   print('------------------------------------------------------\n')

   print('Read signer certificate from device...', end='')
   signer_cert_der_len = AtcaReference(0)
   assert CertStatus.ATCACERT_E_SUCCESS == atcacert_max_cert_size(signer_cert_def, signer_cert_der_len)
   signer_cert_der = bytearray(signer_cert_der_len.value)
   assert CertStatus.ATCACERT_E_SUCCESS == atcacert_read_cert(
      signer_cert_def, signer_ca_pub_key, signer_cert_der, signer_cert_der_len)
   signer_cert = x509.load_der_x509_certificate(signer_cert_der, default_backend())
   print('OK')
   print(certs_handler.get_cert_print_bytes(signer_cert.public_bytes(encoding=Encoding.PEM)))
   print('Extract signer public key...', end='')
   device_ca_pub_key = signer_cert.public_key().public_bytes(format=serialization.PublicFormat.UncompressedPoint,
      encoding=serialization.Encoding.X962)[1:]
   print('OK (Public Key: {})'.format(device_ca_pub_key.hex().upper()))
   print('------------------------------------------------------\n')

   print('Read device certificate from device...', end='')
   device_crt_der_len = AtcaReference(0)
   assert CertStatus.ATCACERT_E_SUCCESS == atcacert_max_cert_size(device_cert_def, device_crt_der_len)
   device_crt_der = bytearray(device_crt_der_len.value)
   assert CertStatus.ATCACERT_E_SUCCESS == atcacert_read_cert(
      device_cert_def, device_ca_pub_key, device_crt_der, device_crt_der_len)
   device_cert = x509.load_der_x509_certificate(device_crt_der, default_backend())
   print('OK')
   print(certs_handler.get_cert_print_bytes(device_cert.public_bytes(encoding=Encoding.PEM)))
   print('Extract device public key...', end='')
   device_pub_key = device_cert.public_key().public_bytes(format=serialization.PublicFormat.UncompressedPoint,
      encoding=serialization.Encoding.X962)[1:]
   print('OK (Public Key: {})'.format(device_pub_key.hex().upper()))
   print('------------------------------------------------------\n')
   return device_cert_def, device_cert

def verify_cert_chain():
   try:
      print('\tVerifying root certificate...', end='')
      root_cert.public_key().verify(signature=root_cert.signature, data=root_cert.tbs_certificate_bytes,
         signature_algorithm=ec.ECDSA(root_cert.signature_hash_algorithm))
      print('OK')

      print('\tVerifying root certificate...', end='')
      root_cert.public_key().verify(signature=signer_cert.signature, data=signer_cert.tbs_certificate_bytes,
         signature_algorithm=ec.ECDSA(signer_cert.signature_hash_algorithm))
      print('OK')

      print('\tVerifying root certificate...', end='')
      signer_cert.public_key().verify(signature=device_cert.signature, data=device_cert.tbs_certificate_bytes,
         signature_algorithm=ec.ECDSA(device_cert.signature_hash_algorithm))
      print('OK')
      return 0
   except:
      return 1
