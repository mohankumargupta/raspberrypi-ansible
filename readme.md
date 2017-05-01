# Use Ubuntu computer to prepare a custom Raspbian image from a virgin Raspbian image

## How it works
Boot Raspberry Pi with a fresh install of Raspbian (remember to put an empty file called ssh in the root
of SD card to enable SSH), then setup a Linux computer with Ansible installed, then run the playbook in this 
repo, and you end up with a more useable Raspbian install.

## Features

- Get updates
- Configure keyboard layout for US
- Installs an on-screen keyboard, Arduino IDE, audacity,
  vlc
- Updates NodeJS, NodeRed and installs node-red-dashboard
  and node-red-node-arduino

# Detailed Instructions

## On the Raspberry Pi (target device)
1. Download latest raspbian from https://www.raspberrypi.org
2. Burn onto SD card using Win32Imager or Etcher
3. Add an empty text file called ssh onto the root
   of SD card
4. Boot

## On a computer running Ubuntu (host computer)

5. Install Ansible 
```sh
sudo add-apt-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get -y install ansible python-pexpect
```

6. Download this repo onto the computer
```sh
git clone https://github.com/mohankumargupta/raspberrypi-ansible.git
cd raspberrypi-ansible
```
     
7. Change the IP address of Raspberry Pi in the hosts file in the raspberrypi-ansible directory
(use Advanced IP Scanner or nmap if running pi headless)
8. Setup ssh keyless login with Raspberry Pi target (replace PI_IP_ADDRESS with IP Address of Pi)
```sh
ssh-keygen
ssh-copy-id pi@PI_IP_ADDRESS 
```
9. Run the following
```sh 
ansible-playbook -i hosts playbook.yml
```

