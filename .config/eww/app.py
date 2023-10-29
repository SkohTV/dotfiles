import psutil
import platform
import distro
import os

from time import sleep


# https://thepythoncode.com/article/get-hardware-system-information-python
def get_size(bytes, suffix="B"):
  """
  Scale bytes to its proper format
  e.g:
    1253656 => '1.20MB'
    1253656678 => '1.17GB'
  """
  factor = 1024
  for unit in ["", "K", "M", "G", "T", "P"]:
    if bytes < factor:
      return f"{bytes:.2f}{unit}{suffix}"
    bytes /= factor

uname = platform.uname()

class data:
  distro = distro.name()
  machine = uname.machine
  kernel = uname.release
  de_wm = os.environ["XDG_CURRENT_DESKTOP"]
  terminal = os.environ["CURRENT_TERM"]
  _shell = os.environ["SHELL"]
  shell = os.path.basename(_shell)




print(f"""Software
OS: {data.distro} {data.machine}
Kernel: {data.kernel}
DE/WM: {data.de_wm}
Terminal: {data.terminal}
Shell: {data.shell}

Hardware
Host: 
CPU: 
GPU: 
RAM: """)

