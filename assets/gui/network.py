"""
Network and internet related functions
"""
import socket

from status import Status
from exceptions import InvalidArgument

# Default port can be set to any reliable site
default_host = "www.google.com"
# Port 80 is default HTTP port
default_port = 80

def check_connection(hostname=default_host, port=default_port):
    if(type(hostname) != str):
        raise InvalidArgument("Invalid argument")
    try:
        # Check DNS by trying to resolve hostname
        host = socket.gethostbyname(hostname)
        # Try to reach host
        host_socket = socket.create_connection(address=(host, port), timeout=2)
        host_socket.close()
        return Status.SUCCESS
    except:
        return Status.FAILURE

