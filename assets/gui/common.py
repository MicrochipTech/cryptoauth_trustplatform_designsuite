import os
import subprocess
import shlex
import platform

def get_os_name():
    return platform.system()

def find_chrome_path():
    os_type = get_os_name().lower()
    result = None
    if 'windows' in os_type:
        import winreg
        for subkey in ['ChromeHTML\\shell\\open\\command', 'Applications\\chrome.exe\\shell\\open\\command']:
            try: result = winreg.QueryValue(winreg.HKEY_CLASSES_ROOT, subkey)
            except WindowsError: pass
            if result is not None:
                result_split = shlex.split(result, False, True)
                result = result_split[0] if result_split else None
                if os.path.isfile(result):
                    break
                result = None
    elif 'darwin' in os_type:
        applist = subprocess.run(["mdfind", "kMDItemKind == 'Application'"], capture_output=True, universal_newlines=True)
        liststr = applist.stdout.split("\n")
        for item in liststr:
            if "chrome" in item.lower():
                result = item
                break
    else:
        return None
    return result
