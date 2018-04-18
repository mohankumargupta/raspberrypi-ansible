#!/usr/bin/bash
pacman -Su --noconfirm
pacman -S python3 tar mingw-w32-i686-gcc make libffi libffi-devel openssl-devel openssh base-devel pkg-config --noconfirm --needed
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
wget https://download.libsodium.org/libsodium/releases/libsodium-1.0.16-mingw.tar.gz
tar xvzf libsodium-1.0.16-mingw.tar.gz
SODIUM_INSTALL=system C_INCLUDE_PATH=~/libsodium-win64/include LIBRARY_PATH=~/libsodium-win64/lib pip install pynacl
pip install ansible