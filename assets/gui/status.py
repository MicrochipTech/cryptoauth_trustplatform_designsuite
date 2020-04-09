"""
Status defines
"""

import enum

class Status(enum.Enum):
    """
    Status codes
    """
    # General
    SUCCESS = 0
    FAILURE = 1
    PATH_ERROR = 2
    BUSY = 3
    INVALID_OPERATION = 4

    # Process
    SUBPROCESS_BUSY = 5
    SUBPROCESS_TERMINATED = 6
    SUBPROCESS_ERROR = 7
    SUBPROCESS_NOT_FOUND = 8
