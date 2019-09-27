from ipywidgets import widgets
from IPython.display import display
from tkinter import Tk, filedialog
import cryptography
from common import *
from cryptography.hazmat.primitives import serialization, hashes
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.asymmetric import ec, utils
import os
from pyasn1_modules import pem

SHARED_SECRET_SLOT = 5 #The slot which contains the symmetric key
ATCA_SUCCESS = 0x00
MAC_MODE = 0x41


def get_symmetric_key():
        csr_der = pem.readPemFromFile(open("../../../TFLXTLS_resource_generation/slot_5_secret_key.pem"),
            startMarker='-----BEGIN SYMMETRIC KEY-----',
            endMarker='-----END SYMMETRIC KEY-----')
        data = bytearray()
        data.extend(csr_der[17:((csr_der[14] - 2)+17)])
        return data




