"""
Main GUI
"""

import os
import sys
import traceback
import time
import webbrowser
import io
import subprocess
import json
import threading
import psutil
import git
import zc.lockfile
import datetime


from contextlib import contextmanager
from pathlib import Path
from PyQt5 import QtGui, QtWidgets, uic
from PyQt5.QtCore import pyqtSlot, pyqtSignal, QObject, QRunnable, QThreadPool, QThread, Qt, QSize
from worker_threads import Worker, WorkerSignals
from jupyter_backend import JupyterServer
from network import check_connection
from status import Status
from git_backend import clonerepo, GitModule
from json_backend import SettingsJson
from common import get_os_name, find_chrome_path


# Current working directory
cwd = Path(__file__).parent.absolute()

# QT designer UI file name/path
QT_UI_FILE = "trustMain.ui"
QT_UI_FILE_PATH = os.path.join(cwd, "assets", "qtui", QT_UI_FILE)

# QWindow icon file name/path
QT_WINDOW_ICON = "shield.ico"
QT_WINDOW_ICON_PATH = os.path.join(cwd, "assets", "qtui", QT_WINDOW_ICON)


class WebPage():
    def __init__(self):
        # Check if chrome is installed
        self.chrome_path = find_chrome_path()
        if(self.chrome_path is None):
            QtWidgets.QMessageBox.critical(
                self,
                "Error",
                "Unable to find Chrome\n\
Please install Chrome and restart the application")
        if get_os_name().lower() != 'darwin' and self.chrome_path:
            webbrowser.register('chrome', None, webbrowser.BackgroundBrowser(self.chrome_path))

    def open_WebPage(self, page_addr):
        webbrowser.open_new(page_addr)

    def open_local_page(self, page_addr):
        json_file = SettingsJson()
        repo_path = json_file.get_repo_path()

        full_path = os.path.join(repo_path, page_addr)
        if os.path.exists(full_path):
            if self.chrome_path:
                try:
                    chrome = webbrowser.get('chrome')
                    chrome.open_new('file://' + full_path)
                except webbrowser.Error:
                    QtWidgets.QMessageBox.critical(
                        self,
                        "Error",
                        "Unable to find Chrome\nPlease install Chrome and restart the application")
            else:
                webbrowser.open_new('file://' + full_path)
        else:
            self.invalid_page()

    def invalid_page(self):
        QtWidgets.QMessageBox.about(self, "Repository not found", "To setup repository go to Design Suite -> Setup -> Repository")

    @pyqtSlot()
    def open_github_designsuite(self):
        self.open_WebPage("https://github.com/MicrochipTech/cryptoauth_trustplatform_designsuite")

    @pyqtSlot()
    def handle_ecc608_tgo_event(self):
        self.open_local_page(os.path.join("assets", "html", "usecase_configurator", "TrustnGO_usecase_library.html"))

    @pyqtSlot()
    def handle_ecc608_tflex_event(self):
        self.open_local_page(os.path.join("assets", "html", "usecase_configurator", "TrustFLEX_configurator.html"))

    @pyqtSlot()
    def handle_ecc608_tcust_event(self):
        self.open_local_page(os.path.join("assets", "html", "usecase_configurator", "TrustCustom_configurator.html"))

    @pyqtSlot()
    def handle_getting_started_event(self):
        self.open_local_page(r"start_here.html")

    @pyqtSlot()
    def web_help(self):
        self.open_WebPage("https://www.microchip.com/design-centers/security-ics/trust-platform")


class Ui(QtWidgets.QMainWindow, WebPage):
    """Main PYQT UI"""
    def __init__(self):
        # Call the inherited classes __init__ method
        super(Ui, self).__init__()

        self.load_ui()
        self.show()
        self.setWindowIcon(QtGui.QIcon(QT_WINDOW_ICON_PATH))

        self.threadpool = QThreadPool()
        self.setup_events()

        # Jupyter Instance
        self.jupyter_server_running = False
        self.jupyter_server_instance = None

        # Setup Git Instance
        self.git_instance = None

        # Python requirements installer instance
        self.pip_requirements = threading.Event()
        self.pip_requirements.clear()

    def load_ui(self):
        """
        Loads UI
        """
        # Load the .ui file
        uic.loadUi(QT_UI_FILE_PATH, self)

        # Disable SHA204 Tab - Will be implemented in future
        self.tabWidget.setTabEnabled(1, False)

        self.setup_statusbar()
        self.setup_menu_qaction()

        # Lock window to current size
        # self.setFixedSize(self.size())

        # Force menubar mode
        self.menubar.setNativeMenuBar(False)

        # Init QSystemTrayIcon
        self.tray_icon = QtWidgets.QSystemTrayIcon(self)
        self.icon = QtGui.QIcon(QT_WINDOW_ICON_PATH)
        self.tray_icon.setIcon(self.icon)
        self.tray_icon.activated.connect(self.tray_icon_activated_callback)

        self.tray_icon.setVisible(False)
        self.menu = QtWidgets.QMenu()

        actionQuit = QtWidgets.QAction("Quit")
        actionQuit.triggered.connect(self.close)
        self.menu.addAction(actionQuit)

        # Add the menu to the tray
        self.tray_icon.setContextMenu(self.menu)


    def setup_default_repo_path(self):
        json_inst = SettingsJson()
        if str(json_inst.get_repo_path()).strip() == "":
            repo_path = os.path.join(str(Path.home()), "Trust_Platform")
            json_inst.set_repo_path(repo_path)

    def tray_icon_activated_callback(self, cause):
        if cause == 1:
            pass
        else:
            self.show()

    def closeEvent(self, event):
        """
        Event called if user tries to close the UI
        """
        #event.accept()
        if self.actionMinimize_to_tray.isChecked():
            self.tray_icon.show()
            self.tray_icon.setVisible(True)
            event.ignore()
            self.hide()
            self.tray_icon.showMessage("Tray Program", "Application was minimized to Tray", QtWidgets.QSystemTrayIcon.Information, 2000)
        else:
            event.accept()

    def setup_statusbar(self):
        self.statusBar = QtWidgets.QStatusBar()
        # Set StatusBar border as 1px grey for visual seperation
        self.statusBar.setStyleSheet("QStatusBar{border-top: 1px outset grey;}")
        self.statusLabel = QtWidgets.QLabel(self)
        self.statusBar.addWidget(self.statusLabel)
        self.setStatusBar(self.statusBar)

    def setup_events(self):
        """
        Setup events
        """
        # Events for labels
        self.label_tgo.clicked.connect(self.handle_ecc608_tgo_event)
        self.label_tflex.clicked.connect(self.handle_ecc608_tflex_event)
        self.label_tcust.clicked.connect(self.handle_ecc608_tcust_event)

        # Event for getting started
        self.btn_getting_started.clicked.connect(self.handle_getting_started_event)

        # Start Jupyter button
        self.openJupyter.clicked.connect(self.handle_jupyter_button)

    def handle_jupyter_button(self):
        json_inst = SettingsJson()
        repo_path = json_inst.get_repo_path()

        if os.path.exists(os.path.join(repo_path, "assets")):
            pass
        else:
            QtWidgets.QMessageBox.about(self, "Repository not found", "To setup repository go to Dessign Suite -> Setup repository")
            return None

        if not self.jupyter_server_running:
            self.jupyter_server_instance = JupyterServer()
            self.jupyter_server_instance.set_target_path(repo_path)
            worker = Worker(self.jupyter_server)
            worker.signals.finished.connect(self.notebook_start_stop_callback)
            self.threadpool.start(worker)
            self.openJupyter.setText("Stop Jupyter")
        else:
            self.jupyter_server_instance.stop_jupyter()

    def jupyter_server(self, progress_callback):
        self.jupyter_server_running = True
        self.jupyter_server_instance.start()

    def notebook_start_stop_callback(self):
        self.jupyter_server_running = False
        self.openJupyter.setText("Start Jupyter")

    def setup_menu_qaction(self):
        json_inst = SettingsJson()
        repo_path = json_inst.get_repo_path()

        self.actionExit.setShortcut("Ctrl+Q")
        self.actionExit.setStatusTip("Exit Application")
        self.actionExit.triggered.connect(self.close)

        # Action Help - Open developer help
        self.actionWeb_documentation.setStatusTip("Opens TrustPlatform product page")
        self.actionWeb_documentation.triggered.connect(self.web_help)

        # Action Help - About
        self.actionAbout.setStatusTip("About")
        self.actionAbout.triggered.connect(self.qaction_about)

        # Action Designsuite open github
        self.actionOpen_GitHub_page.setStatusTip("Opens 'TrustPlatform Design Suite' on GitHub")
        self.actionOpen_GitHub_page.triggered.connect(self.open_github_designsuite)

        # Action DesignSuite - Git clone
        self.actionRepository.setStatusTip("Download and install 'TrustPlatform Design Suite'")
        self.actionRepository.triggered.connect(self.clone_dialog)

        # Action File - Minimize to tray
        self.actionMinimize_to_tray.setStatusTip("Minimizes to tray")
        self.actionMinimize_to_tray.triggered.connect(self.minimize_to_tray_callback)

        # Action Repository - Clean repository
        self.actionClean.setStatusTip("Revert changes in working directory")
        self.actionClean.triggered.connect(self.git_clean_trustplatform)

        # Action Repository - git pull repository (Update)
        self.actionGet_latest_version.setStatusTip("Update working directory to latest version")
        self.actionGet_latest_version.triggered.connect(self.git_update_trustplatform)

        # Action Repository - Setup - MPLAB Path
        self.actionMPLAB_path.triggered.connect(self.set_mplab_path)
        self.actionMPLAB_path.setStatusTip("Select MPLAB path to program through Notebook")

    def update_mplab_statustip(self):
        json_inst = SettingsJson()

        if json_inst.is_mplab_path_set():
            self.actionMPLAB_path.setStatusTip("Path: {}".format(json_inst.get_mplab_path()))

    def qaction_about(self):
        QtWidgets.QMessageBox.about(self, "Trust Platform",
            "Version : 1.3.1 \nDate: 20th April 2020"
            )

    def minimize_to_tray_callback(self):
        if self.actionMinimize_to_tray.isChecked():
            self.tray_icon.show()
        else:
            self.tray_icon.hide()

    def clone_dialog(self):
        json_inst = SettingsJson()
        # Get clone destiniation
        selected_path = QtWidgets.QFileDialog.getExistingDirectory(self, "Select folder", str(Path.home()))

        if selected_path:
            new_path = str(Path(selected_path))
        else:
            return None

        json_inst.set_repo_path(new_path)
        valid_git_repo = None

        try:
            gitObj = GitModule()
            gitObj.set_repo_path(new_path)
            gitObj.init_repo()
            valid_git_repo = True
        except:
            valid_git_repo = False

        if valid_git_repo:
            try:
                description, active_branch, last_commit, remote_name, remote_url = gitObj.get_info()

                if ("https://github.com/MicrochipTech/cryptoauth_trustplatform_designsuite.git".strip() in remote_url):
                    # Valid TrustPlatform repository
                    pass
                else:
                    QtWidgets.QMessageBox.about(self, "Invalid repository", "Directory does not contain trustplatform repository !")
                    json_inst.reset_repo_path()
                    return None
            except:
                QtWidgets.QMessageBox.about(self, "Invalid repository", "Directory does not contain a valid repository !")
                return 1

            try:
                if gitObj.is_dirty():
                    buttonReply = QtWidgets.QMessageBox.question(self, "Valid repository found", "Repo has modified files, would you like to clean ?", QtWidgets.QMessageBox.Yes | QtWidgets.QMessageBox.No, QtWidgets.QMessageBox.No)

                    if buttonReply == QtWidgets.QMessageBox.Yes:
                        self.git_clean_trustplatform()
                    elif buttonReply == QtWidgets.QMessageBox.No:
                        pass
                else:
                    QtWidgets.QMessageBox.about(self, "Valid repository found", "Repo is clean and ready to use!")
            except:
                QtWidgets.QMessageBox.about(self, "Error", "Repository clean operation failed !")
        else:
            new_foldername = "TPDS_"+datetime.datetime.now().strftime(
                "%m%d%H%M%S")
            try:
                full_path_tplat = Path(os.path.join(new_path, new_foldername))
                os.mkdir(full_path_tplat)
                json_inst.set_repo_path(str(full_path_tplat))
            except Exception as e:
                QtWidgets.QMessageBox.about(self, "Error", "An error occured while creating a directory under {}".format(new_path))

            # Setup Grid for Dialog
            grid = QtWidgets.QGridLayout()
            grid.setSpacing(10)

            self.gitclone_dialog = QtWidgets.QDialog()

            self.git_clone_TE = QtWidgets.QTextEdit()
            self.git_clone_TE.setReadOnly(True)
            grid.addWidget(self.git_clone_TE, 0, 0, 7, 9)

            self.gitclone_dialog.setWindowTitle("Cloning from Github repository")
            self.gitclone_dialog.setWindowModality(Qt.ApplicationModal)
            self.gitclone_dialog.setWindowIcon(QtGui.QIcon(QT_WINDOW_ICON_PATH))
            self.gitclone_dialog.setLayout(grid)
            self.git_clone_trustplatform()
            self.gitclone_dialog.exec_()

            if self.git_instance is not None:
                self.git_instance.stop_gitprocess()

    def git_clone_trustplatform(self):
        workergit = Worker(self.git_clone_thread)
        workergit.signals.finished.connect(self.git_clone_done_callback)
        workergit.signals.result.connect(self.git_clone_result_callback)
        workergit.signals.progress.connect(self.git_clone_progress)
        self.threadpool.start(workergit)

    def git_clone_thread(self, progress_callback):
        json_inst = SettingsJson()
        repo_path = json_inst.get_repo_path()
        remote_url = r"https://github.com/MicrochipTech/cryptoauth_trustplatform_designsuite.git"

        try:
            self.git_instance = GitModule()
            self.git_instance.set_repo_path(repo_path)
            self.git_instance.set_progress_callback(progress_callback)
            return self.git_instance.clone_from(remote_url, repo_path)
        except:
            return 1

    def git_clone_result_callback(self, val):
        if isinstance(val, int):
            if val > 0:
                self.git_clone_TE.append("")
                self.git_clone_TE.append("Repo clone - Failed")
            elif val == 0:
                self.git_clone_TE.append("")
                self.git_clone_TE.append("Repo clone - Success")

                self.gitclone_dialog.close()
                self.python_package_updater()

    def git_clone_done_callback(self):
        #self.git_clone_TE.append("\n")
        #self.git_clone_TE.append("Repo cloned successfully!")
        pass

    def git_clone_progress(self, s):
        self.git_clone_TE.setText(s)


    def git_clean_trustplatform(self):
        buttonReply = QtWidgets.QMessageBox.question(self, 'GIT Clean options', "Do you want to keep temporary files. eg,keys, certificates etc... ", QtWidgets.QMessageBox.Yes | QtWidgets.QMessageBox.No, QtWidgets.QMessageBox.No)

        grid = QtWidgets.QGridLayout()
        grid.setSpacing(10)

        self.gitclean_dialog = QtWidgets.QDialog()

        self.git_clean_TE = QtWidgets.QTextEdit()
        self.git_clean_TE.setReadOnly(True)
        grid.addWidget(self.git_clean_TE, 0, 0, 7, 9)

        self.gitclean_dialog.setWindowTitle("Clean Github repository")
        self.gitclean_dialog.setWindowModality(Qt.ApplicationModal)
        self.gitclean_dialog.setWindowIcon(QtGui.QIcon(QT_WINDOW_ICON_PATH))
        self.gitclean_dialog.setLayout(grid)

        if buttonReply == QtWidgets.QMessageBox.Yes:
            workergit = Worker(self.git_clean_thread, False)
        elif buttonReply == QtWidgets.QMessageBox.No:
            workergit = Worker(self.git_clean_thread, True)
        else:
            return None

        workergit.signals.finished.connect(self.git_clean_finished)
        workergit.signals.result.connect(self.git_clean_result)
        workergit.signals.progress.connect(self.git_clean_progress)
        self.threadpool.start(workergit)
        self.gitclean_dialog.exec_()

    def git_clean_thread(self, remove_untracked, progress_callback):
        json_inst = SettingsJson()
        repo_path = json_inst.get_repo_path()

        try:
            gitObj = GitModule()
            gitObj.set_repo_path(repo_path)
            gitObj.init_repo()

            progress_callback.emit("Started cleaning repo")

            if(remove_untracked):
                progress_callback.emit("Removing temporary files")
                gitObj.reset_repo_hard()
            else:
                progress_callback.emit("Retaining temporary files")
                gitObj.clean_repo()
        except:
            return 1

        return 0

    def git_clean_finished(self):
        pass

    def git_clean_result(self, val):
        if val > 0:
            self.git_clean_TE.append("")
            self.git_clean_TE.append("Clean repository - Fail")
        elif val == 0:
            self.git_clean_TE.append("")
            self.git_clean_TE.append("Clean repository - Done")

    def git_clean_progress(self,s):
        self.git_clean_TE.append(s)

    def git_update_trustplatform(self):
        json_inst = SettingsJson()
        repo_path = json_inst.get_repo_path()

        try:
            gitObj = GitModule()
            gitObj.set_repo_path(repo_path)
            gitObj.init_repo()
            self.git_update_dialog()
        except:
            QtWidgets.QMessageBox.about(self, "Invalid repository", "Path '{}' does not have a valid repository".format(repo_path))

        buttonReply = QtWidgets.QMessageBox.question(self, "Python package updates", "Do you want to update python packages", QtWidgets.QMessageBox.Yes | QtWidgets.QMessageBox.No, QtWidgets.QMessageBox.No)
        if buttonReply == QtWidgets.QMessageBox.Yes:
            self.python_package_updater()
        elif buttonReply == QtWidgets.QMessageBox.No:
            pass

    def git_update_dialog(self):
        grid = QtWidgets.QGridLayout()
        grid.setSpacing(10)

        self.gitupdate_dialog = QtWidgets.QDialog()

        self.git_update_TE = QtWidgets.QTextEdit()
        self.git_update_TE.setReadOnly(True)
        grid.addWidget(self.git_update_TE, 0, 0, 7, 9)

        self.gitupdate_dialog.setWindowTitle("Update repository")
        self.gitupdate_dialog.setWindowModality(Qt.ApplicationModal)
        self.gitupdate_dialog.setWindowIcon(QtGui.QIcon(QT_WINDOW_ICON_PATH))
        self.gitupdate_dialog.setLayout(grid)

        workergit = Worker(self.git_update_thread)
        workergit.signals.finished.connect(self.git_update_finished)
        workergit.signals.result.connect(self.git_update_result)
        workergit.signals.progress.connect(self.git_update_progress)
        self.threadpool.start(workergit)

        self.gitupdate_dialog.exec_()

        if self.git_instance is not None:
            self.git_instance.stop_gitprocess()

    def git_update_thread(self, progress_callback):
        json_inst = SettingsJson()
        repo_path = json_inst.get_repo_path()

        # Repo init
        self.git_instance = GitModule()
        self.git_instance.set_repo_path(repo_path)
        self.git_instance.init_repo()
        self.git_instance.set_progress_callback(progress_callback)

        # Repo fetch
        progress_callback.emit("Fetching GitHub repository information")
        fetch_return_code = self.git_instance.fetch_origin()
        if fetch_return_code == 0:
            pass
        else:
            progress_callback.emit("Fetch failed")
            return 1

        # Check if repo is upto date
        commits_behind = self.git_instance.get_commits_behind()
        if(len(commits_behind)):
            progress_callback.emit("\n")
            progress_callback.emit("New version is available")
        else:
            progress_callback.emit("Repository already upto date")
            return 0

        # Git pull section
        progress_callback.emit("Pulling latest version from GitHub")
        if self.git_instance.pull_origin() == 0:
            progress_callback.emit("")
            progress_callback.emit("Update - Done")
        else:
            progress_callback.emit("")
            progress_callback.emit("Update - Failed")

        # Time before it closes
        time.sleep(1)

    def git_update_finished(self):
        pass

    def git_update_result(self, val):
        pass

    def git_update_progress(self, s):
        self.git_update_TE.setText(s)

    # Python package updater code
    def python_package_updater(self):
        json_inst = SettingsJson()
        repo_path = json_inst.get_repo_path()

        if os.path.exists(os.path.join(repo_path, "assets", "requirements.txt")):
            grid = QtWidgets.QGridLayout()
            grid.setSpacing(10)

            self.pip_package_update_dialog = QtWidgets.QDialog()

            self.pip_update_TE = QtWidgets.QTextEdit()
            self.pip_update_TE.setReadOnly(True)
            grid.addWidget(self.pip_update_TE, 0, 0, 7, 9)

            self.pip_package_update_dialog.setWindowTitle("Update python packages")
            self.pip_package_update_dialog.setWindowModality(Qt.ApplicationModal)
            self.pip_package_update_dialog.setWindowIcon(QtGui.QIcon(QT_WINDOW_ICON_PATH))
            self.pip_package_update_dialog.setLayout(grid)

            workergit = Worker(self.python_package_updater_thread)
            workergit.signals.finished.connect(self.pip_package_update_finished)
            workergit.signals.result.connect(self.pip_package_update_result)
            workergit.signals.progress.connect(self.pip_package_update_progress)
            self.threadpool.start(workergit)

            self.pip_package_update_dialog.exec_()

            # Close all background process
            self.pip_requirements.set()
        else:
            QtWidgets.QMessageBox.about(self, "Requirements.txt not found", "To setup repository go to Design Suite -> Setup -> Repository")

    def count_valid_lines(self, file_name):
        count =0
        with open(file_name, 'r') as f:
            sline = f.readline()
            while sline:
                if(len(sline.strip().replace("\n", "").replace("\r", "")) >0):
                    count +=1
                else:
                    pass
                sline = f.readline()
        return count

    def python_package_updater_thread(self, progress_callback):
        json_inst = SettingsJson()
        repo_path = json_inst.get_repo_path()
        self.pip_requirements.clear()

        requirements_file_path = os.path.join(repo_path, "assets", "requirements.txt")
        numValidLines = self.count_valid_lines(requirements_file_path)

        with open(requirements_file_path, mode='r') as f:
            package = f.readline().strip()
            cnt = 1
            while package:
                progress_callback.emit("Installing module ({} of {}): {}".format(cnt, numValidLines, package.strip()))
                cnt +=1
                process = subprocess.Popen([sys.executable, "-m", "pip", "install", "--upgrade", package, "--disable-pip-version-check"],
                        stdout= subprocess.PIPE,
                        stderr= subprocess.STDOUT,
                        universal_newlines= True,
                        shell = False)
                while True:
                    stdoutput = process.stdout.readline()
                    if stdoutput:
                        progress_callback.emit(stdoutput.strip())
                    if process.poll() is not None:
                        process.stdout.close()
                        break
                    if self.pip_requirements.is_set():
                        try:
                            for child in psutil.Process(process.pid).children(recursive=True):
                                child.kill()
                            process.kill()
                        except:
                            pass
                        finally:
                            return 1
                progress_callback.emit("-----------------")
                package = f.readline().strip()
            return 0

    def pip_package_update_finished(self):
        pass

    def pip_package_update_result(self, val):
        if isinstance(val, int):
            if val > 0:
                self.pip_update_TE.append("Python package update failed with error code {}".format(val))
            elif val == 0:
                self.pip_update_TE.append("Python package update - Done")

    def pip_package_update_progress(self, s):
        self.pip_update_TE.append(s)

    # Code to update MPLAB path
    def set_mplab_path(self):
        home_path = Path.home()
        json_inst = SettingsJson()

        QtWidgets.QMessageBox.about(self, "Select MPLAB folder", "Example: \n C:\Program Files (x86)\Microchip\MPLABX\\v5.25")
        mplab_path = QtWidgets.QFileDialog.getExistingDirectory(self, "Select folder", str(home_path))

        if not mplab_path:
            return None

        os_type = get_os_name().lower()

        if 'windows' in os_type:
            ipefile = os.path.join("mplab_platform", "mplab_ipe", "ipecmd.jar")
        elif 'linux' in os_type:
            ipefile = os.path.join("mplab_platform", "mplab_ipe", "ipecmd.jar")
        elif 'darwin' in os_type:
            ipefile = os.path.join("mplab_platform", "mplab_ipe", "bin", "ipecmd.sh")
        else:
            error_dlg = QtWidgets.QMessageBox()
            error_dlg.setIcon(QtWidgets.QMessageBox.Critical)
            error_dlg.setText("Unknown operating system")
            error_dlg.exec_()
            return None

        full_path_ipecmd = Path(os.path.join(mplab_path, ipefile))

        if os.path.exists(full_path_ipecmd):
            config_data = None
            try:
                json_inst.set_mplab_path(Path(mplab_path))

                self.update_mplab_statustip()
                QtWidgets.QMessageBox.about(self, "Success", "MPLAB programmer path is set to {}".format(str(full_path_ipecmd)))
            except:
                QtWidgets.QMessageBox.about(self, "Error", "Unable to open {}".format(str(trustplatform_config_json)))
                return None
        else:
            QtWidgets.QMessageBox.about(self, "Error", "Selected Path is invalid")

class LockedError(QtWidgets.QWidget):
    """Main PYQT UI"""
    def __init__(self):
        # Call the inherited classes __init__ method
        super(LockedError, self).__init__()
        self.setMinimumSize(QSize(100, 100))
        self.setWindowTitle("Trustplatform")
        self.setWindowIcon(QtGui.QIcon(QT_WINDOW_ICON_PATH))
        self.show()
        QtWidgets.QMessageBox.critical(self, "Error", "Another instance of trustplatform is already open")
        self.close()
        sys.exit()

    def closeEvent(self, event):
        """
        Event called if user tries to close the UI
        """
        event.accept()

if __name__ == "__main__":
    json_inst = SettingsJson()
    lock_file = os.path.join(Path.home(), '.trustplatform', 'trustplatform.lock')

    APP = QtWidgets.QApplication(sys.argv)
    try:
        lock = zc.lockfile.LockFile(lock_file)
    except zc.lockfile.LockError:
        print("Another instance of Trust Platform is already open!")
        WINDOW = LockedError()
    else:
        print("This prompt runs Trust Platform GUI, Do NOT close this window.")
        WINDOW = Ui()
        WINDOW.show()
    sys.exit(APP.exec_())
