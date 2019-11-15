import sys
import subprocess
from collections import namedtuple
import pkg_resources

class requirements_installer():
    def __init__(self, requirements_file):
        self.file_name = requirements_file
        self.__install_dependency()

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

    def run_subprocess_cmd(self, cmd):
        proc = subprocess.Popen(cmd,
                stdout= subprocess.PIPE,
                stderr= subprocess.PIPE,
                universal_newlines=True,
                shell=True
        )
        stdout, stderr = proc.communicate()
        subProcessOut = namedtuple("subProcessOut", ['returncode', 'stdout', 'stderr'])
        return subProcessOut(proc.returncode, stdout, stderr)

    def __install_dependency(self):
        numValidLines = self.count_valid_lines(self.file_name)

        with open(self.file_name, mode='r') as f:
            package = f.readline().strip()
            package_list = []
            package_list += [p.project_name for p in pkg_resources.working_set]
            cnt = 1

            while package:
                print("Installing module ({} of {}): {}".format(cnt, numValidLines, package.strip()))
                cnt +=1
                if not package in package_list:
                    subProcessOut = self.run_subprocess_cmd([sys.executable, "-m", "pip", "install", "--upgrade", package])
                    print(subProcessOut.stdout)
                    print(subProcessOut.stderr)

                print("-----------------------------------------")
                package = f.readline().strip()
            print("Completed installing dependencies\r\n")

#requirements_installer("requirements.txt")