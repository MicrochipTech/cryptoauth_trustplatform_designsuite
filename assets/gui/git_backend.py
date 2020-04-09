import git
import sys
import traceback
import subprocess
import io
import threading
import psutil
import pathlib

from contextlib import contextmanager
from exceptions import PathError

from PyQt5 import QtGui, QtWidgets, uic
from PyQt5.QtCore import pyqtSlot, pyqtSignal, QObject, QRunnable, QThreadPool

def clonerepo(source, destination, progress_callback):
    cmd = ["git", "clone", "--progress", source, destination]
    proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    for line in io.TextIOWrapper(proc.stdout, encoding="utf-8"):
        progress_callback.emit(line)

    proc.stdout.close()
    return_code = proc.wait()
    if return_code:
        raise subprocess.CalledProcessError(return_code, cmd)
    return return_code

class MyProgressPrinter(git.RemoteProgress):
    def __init__(self, progress):
        self.progress = progress
        super(MyProgressPrinter, self).__init__()

    def update(self, op_code, cur_count, max_count=None, message=''):
        self.progress()
        print(op_code, cur_count, max_count, cur_count / (max_count or 100.0), message or "NO MESSAGE")

class GitModule(git.RemoteProgress):
    def __init__(self):
        super(GitModule, self).__init__()
        self.repo_path = None
        self.repo = None
        self.progress_callback = None
        self.event_stop = threading.Event()
        self.event_stop.clear()

    def stop_gitprocess(self):
        self.event_stop.set()

    def set_repo_path(self, path):
        self.repo_path = path

    # Overloading base class update function
    def update(self, op_code, cur_count, max_count=None, message=''):
        if self.progress_callback is None:
            return None
        op_code = op_code & git.RemoteProgress.OP_MASK
        if op_code == git.RemoteProgress.COUNTING:
            self.progress_callback.emit('Counting objects: {} {}'.format(str(cur_count), str(message)))
        elif op_code == git.RemoteProgress.COMPRESSING:
           self.progress_callback.emit('Compressing objects: {} ({}/{}) {}'.format(((cur_count/max_count) * 100), str(cur_count), str(max_count), str(message)))
        elif op_code == git.RemoteProgress.WRITING:
            self.progress_callback.emit('Writing objects: {} ({}/{}) {}'.format((cur_count/max_count) * 100, cur_count, max_count, str(message)))
        elif op_code == git.RemoteProgress.RECEIVING:
            self.progress_callback.emit('Receiving objects: {} ({}/{}) {}'.format((cur_count/max_count) * 100, cur_count, max_count, str(message)))
        elif op_code == git.RemoteProgress.RESOLVING:
            self.progress_callback.emit('Resolving objects: {} ({}/{}) {}'.format((cur_count/max_count) * 100, cur_count, max_count, str(message)))
        elif op_code == git.RemoteProgress.FINDING_SOURCES:
            self.progress_callback.emit('Finding Sources: {} ({}/{}) {}'.format((cur_count/max_count) * 100, cur_count, max_count, str(message)))
        elif op_code == git.RemoteProgress.RESOLVING:
            self.progress_callback.emit('remote: Resolving deltas: {} ({}/{}) {}'.format((cur_count/max_count) * 100, cur_count, max_count, str(message)))
        else:
            self.progress_callback.emit('Processing: {} ({}/{}) {}'.format((cur_count/max_count) * 100, cur_count, max_count, str(message)))

        #print(op_code, cur_count, max_count, cur_count / (max_count or 100.0), message or "NO MESSAGE")
        return None

    def set_progress_callback(self, progress_callback):
        self.progress_callback = progress_callback

    def init_repo(self):
        if self.repo_path is None:
            raise PathError

        self.repo = git.Repo(self.repo_path)

    def active_head(self):
        return self.repo.heads[0]

    def get_info(self):
        description = self.repo.description
        active_branch = self.repo.active_branch
        last_commit = str(self.repo.head.commit.hexsha)
        remote_name = self.repo.remotes[0]
        remote_url = self.repo.remotes[0].url

        return (description, active_branch, last_commit, remote_name, remote_url)

    def is_dirty(self):
        return self.repo.is_dirty()

    def get_active_branch(self):
        return self.repo.active_branch.name

    def reset_repo_hard(self):
        self.repo.git.reset("--hard")
        self.repo.git.clean("-xdf")
        self.repo.heads.master.checkout()
        self.repo.git.reset("--hard")
        self.repo.git.clean("-xdf")

    def clean_repo(self):
        self.repo.git.reset("--hard")
        self.repo.heads.master.checkout()
        self.repo.git.reset("--hard")

    def clone_from(self, from_url, to_loc):
        cmd = ["git", "clone", "--progress", "--recurse-submodules", from_url, to_loc]
        process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, universal_newlines=True)
        while True:
            stdoutput = process.stdout.readline().strip()
            if stdoutput:
                self.progress_callback.emit(stdoutput)
            if process.poll() is not None:
                process.stdout.close()
                return_code = process.wait()
                return 0
            if self.event_stop.is_set():
                for child in psutil.Process(process.pid).children(recursive=True):
                    child.kill()
                process.kill()
                return 1

    def fetch_origin(self):
        fetch_log = []
        for fetch_info in self.repo.remotes.origin.fetch(progress=self):
            fetch_log.append(fetch_info.ref, fetch_info.commit, fetch_info.flags)
        return fetch_log

    def pull_origin(self):
        pathstr = '''"'''+str(pathlib.PurePosixPath(pathlib.Path(self.repo_path)))+'''"'''
        cmd = ["git", "-C", pathstr, "pull", "--progress", "--recurse-submodules"]
        process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, universal_newlines=True)
        while True:
            stdoutput = process.stdout.readline().strip()
            if stdoutput:
                self.progress_callback.emit(stdoutput)
            if process.poll() is not None:
                process.stdout.close()
                return_code = process.wait()
                return 0
            if self.event_stop.is_set():
                for child in psutil.Process(process.pid).children(recursive=True):
                    child.kill()
                process.kill()
                return 1

    def get_commits_ahead(self):
        commits_ahead = self.repo.iter_commits('origin/master..master')
        return list(commits_ahead)

    def get_commits_behind(self):
        commits_ahead = self.repo.iter_commits('master..origin/master')
        return list(commits_ahead)

    def update_submodule(self, to_latest_rev):
        self.repo.submodule_update(recursive=True, progress=self, init=True, to_latest_revision=to_latest_rev)

