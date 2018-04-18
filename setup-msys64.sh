#!/usr/bin/bash
#pacman -Su --noconfirm
pacman -S python3 tar libffi libffi-devel base-devel gcc pkg-config make openssl-devel openssh --noconfirm --needed
#pacman -S python3 tar mingw-w64-x86_64-gcc make libffi libffi-devel openssl-devel openssh --noconfirm --needed
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
wget https://download.libsodium.org/libsodium/releases/libsodium-1.0.16-mingw.tar.gz
tar xvzf libsodium-1.0.16-mingw.tar.gz
PATH=$PATH:/c/msys64/mingw64/bin
export PATH
SODIUM_INSTALL=system C_INCLUDE_PATH=~/libsodium-win64/include LIBRARY_PATH=~/libsodium-win64/lib python3 -m pip install pynacl
python3 -m pip install ansible
