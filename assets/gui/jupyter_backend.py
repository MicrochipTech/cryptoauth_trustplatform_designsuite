"""
Jupyter backend - to start, run, monitor, kill jupyter backend.
"""
import os
import sys
import signal
import subprocess
import pathlib
import threading
import psutil

from exceptions import InvalidArgument
from notebook import notebookapp
from status import Status

class JupyterServer():
    """
    Jupyter server class
    """
    def __init__(self):
        """
        Init class variables
        """
        self.executable_path = ""
        self.target_path = ""
        self.instance = None
        self.event_stop = threading.Event()
        self.event_stop.clear()

    def stop_jupyter(self):
        self.event_stop.set()

    def clear_events(self):
        self.event_stop.clear()

    def set_executable_path(self, path):
        """
        Set jupyter-notebook-script path
        """
        self.executable_path = path

    def set_target_path(self, path):
        """
        Set target path (Notebook location)
        """
        self.target_path = path

    def is_path(self, path):
        """
        Sanity checks on path
        """
        return os.path.exists(path)

    def start(self):
        """
        Start Jupyter notebook instance
        """
        self.event_stop.clear()

        pathstr = '''"'''+str(pathlib.PurePosixPath(pathlib.Path(self.target_path)))+'''"'''
        pathcmd = "--notebook-dir"

        if self.instance == None:
            cmd = ["jupyter", "notebook", pathcmd, pathstr]
            self.instance = subprocess.Popen(cmd,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.STDOUT,
                                shell=False
            )
            while True:
                try:
                    outs, errs = self.instance.communicate(timeout=1)
                except subprocess.TimeoutExpired:
                    pass
                if self.instance.poll() is not None:
                    self.instance.stdout.close()
                    return_code = self.instance.wait()
                    return 1
                if self.event_stop.is_set():
                    for child in psutil.Process(self.instance.pid).children(recursive=True):
                        child.kill()
                    self.instance.kill()
                    return 1
        else:
            return Status.SUBPROCESS_BUSY

    def kill(self):
        """
        Kill Jupyter notebook instance
        """
        if not type(self.instance) == subprocess.Popen:
            return Status.SUBPROCESS_NOT_FOUND

        if self.instance.poll() != None:
            return Status.SUBPROCESS_TERMINATED
        else:
            for child in psutil.Process(self.instance.pid).children(recursive=True):
                child.kill()
            self.instance.kill()

    def terminate(self):
        """
        Terminate Jupyter notebook instance
        """
        if not type(self.instance) == subprocess.Popen:
            return Status.SUBPROCESS_NOT_FOUND

        if self.instance.poll() != None:
            return Status.SUBPROCESS_TERMINATED
        else:
            self.instance.terminate()

    def exit_gracefully(self):
        """
        Exit Jupyter gracefully (Supported only on windows)
        """
        if not type(self.instance) == subprocess.Popen:
            return Status.SUBPROCESS_NOT_FOUND

        if self.instance.poll() != None:
            return Status.SUBPROCESS_TERMINATED
        else:
            #self.instance.send_signal(signal.CTRL_C_EVENT)
            self.instance.send_signal(signal.CTRL_C_EVENT)

class Notebook():
    """
    Provides notebook APIs for housekeeping tasks
    """
    def __init__(self, mode=0):
        """
        Operates in two modes.
        Mode 0 - Uses Notebook python package
        Mode 1 - Uses subprocess implementation (Currently not implemented)
        """
        self.mode = mode

    def list(self):
        if self.mode == 0:
            return list(notebookapp.list_running_servers())
        elif self.mode == 1:
            pass
        else:
            raise InvalidArgument("Invalid notebook class mode")
