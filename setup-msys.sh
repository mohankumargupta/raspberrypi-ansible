#!/usr/bin/bash
which ansible >/dev/null 2>&1
if [ $? -ne 0 ];
then
echo "Installing Ansible..."
sleep 5
pushd .
cd ~
pacman -S libyaml-devel python2 tar libffi libffi-devel gcc pkg-config make openssl-devel openssh --noconfirm --needed
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python2 get-pip.py
wget -c https://download.libsodium.org/libsodium/releases/libsodium-1.0.16-mingw.tar.gz
tar xvzf libsodium-1.0.16-mingw.tar.gz
SODIUM_INSTALL=system CFLAGS=`pkg-config --cflags libffi` LDFLAGS=`pkg-config --libs libffi` C_INCLUDE_PATH=~/libsodium-win64/include LIBRARY_PATH=~/libsodium-win64/lib python2 -m pip install cffi --no-binary :all:
SODIUM_INSTALL=system CFLAGS=`pkg-config --cflags libffi` LDFLAGS=`pkg-config --libs libffi` C_INCLUDE_PATH=~/libsodium-win64/include LIBRARY_PATH=~/libsodium-win64/lib python2 -m pip install pynacl
python2 -m pip install ansible --no-binary :all:
popd
fi

which ansible >/dev/null 2>&1
if [ $? -eq 0 ];
then
echo "Ansible installed."
else
echo "Ansible not installed."
fi