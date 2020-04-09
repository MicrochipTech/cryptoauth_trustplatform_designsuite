import os
import json
import subprocess
from pathlib import Path

from common import get_os_name
from exceptions import UnrecogonizedOperatingSystem

json_dict = {"general": {"minimize_to_tray": "False",
                    "run_at_startup": "False",
                    "check_updates_startup": "False"},
            "repo": {"path": "",
                    "clone_url": "https://github.com/MicrochipTech/cryptoauth_trustplatform_designsuite.git",
                    "github_url": "https://github.com/MicrochipTech/cryptoauth_trustplatform_designsuite"},

            "MPLABX": {"path_set": "False",
                    "ipe_path": ""
            }
            }

json_name = "trustplatform.config"

class SettingsJson():
    def __init__(self):
        os_type = get_os_name().lower()
        self.trustplatform_directory = ".trustplatform"
        file_name = os.path.join(Path.home(), self.trustplatform_directory, json_name)

        if os.path.exists(file_name):
            self.file_name = file_name
            try:
                self.get_mplab_path()
            except KeyError:
                data = self.read_file()
                data["MPLABX"] = {
                    "path_set": "False",
                    "ipe_path": ""
                }
                self.write_file(data)
        else:
            dir_full_path = os.path.join(Path.home(), self.trustplatform_directory)
            if not os.path.exists(dir_full_path):
                Path(dir_full_path).mkdir(parents=True, exist_ok=True)
                os_type = get_os_name().lower()
                if 'windows' in os_type:
                    subprocess.call(["attrib", "+H", dir_full_path])
                elif 'linux' in os_type:
                    subprocess.call(["chflags", "hidden", dir_full_path])
                elif 'darwin' in os_type:
                    subprocess.call(["chflags", "hidden", dir_full_path])
                else:
                    raise UnrecogonizedOperatingSystem("OS not compatible")

            with open(file_name, 'w') as f:
                json.dump(json_dict, f, indent=4)
            self.file_name = file_name

    def read_file(self):
        with open(self.file_name, 'r') as f:
            data = json.load(f)
        return data

    def write_file(self, data):
        with open(self.file_name, 'w') as f:
            json.dump(data, f, indent=4)

    def get_repo_path(self):
        json_data = self.read_file()
        return json_data["repo"]["path"]

    def set_repo_path(self, path_str):
        json_data = self.read_file()
        json_data["repo"]["path"] = path_str
        self.write_file(json_data)
        return None

    def reset_repo_path(self):
        self.set_repo_path("")
        return None

    def set_mplab_path(self, path):
        json_data = self.read_file()
        json_data["MPLABX"]["path_set"] = "True"
        json_data["MPLABX"]["ipe_path"] = str(path)
        self.write_file(json_data)

    def is_mplab_path_set(self):
        json_data = self.read_file()
        if json_data["MPLABX"]["path_set"] == "True":
            return True
        else:
            return False

    def get_mplab_path(self):
        json_data = self.read_file()
        return json_data["MPLABX"]["ipe_path"]