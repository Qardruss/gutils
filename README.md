# gutils

> General Utilities

The opensource Github repo for the gutils project

Gutils is a project with certain useless programs and some useful ones
Gutils might be a future GNU replacement

Releases in the 'bin' folder
the bin folder got accidentially deleted and we can't find a way to bring it back
We will throw the releases into Github Releases

# Manual Compilation

You need Go 1.15.2 and Python 3.9.7 to compile this
You also need to install the Python package 'pyinstaller' to compile this
You also need upx installed ('sudo dnf install -y upx' for Fedora/Red Hat, 'sudo apt install -y upx' for Ubuntu/Ubuntu-based distros)

Just run `make full-package` and it should do some magic and look in the 'bin' folder to get the executables
