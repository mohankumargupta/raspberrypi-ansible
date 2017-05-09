# Start with a vanilla Raspbian image, end up with a turbocharged custom Raspbian image 

## How it works
Boot Raspberry Pi with a fresh install of Raspbian (remember to put an empty file called ssh in the root
of SD card to enable SSH, and optionally a wpa_supplicant.conf to automatically connect to wifi if running headless, see wpa_supplicant-sample.conf for an example), then setup a  Debian-based (Linux Mint, Ubuntu, Debian) computer with Ansible installed, then run the playbook in this 
repo, and you end up with a more useable Raspbian install.

## Features

- Get updates
- Configure keyboard layout for US
- Install an on-screen keyboard
- Enables VNC (need to manually Sign in for VNC Cloud Connect), Serial
- Install Arduino IDE, audacity, vlc, grafana
- Updates NodeJS and NodeRed
- Installs NodeRED modules
- Installs LAMP(Apache, MySQL,PHP)
- Installs ngrok to allow webserver access over the internet
- Install nginx as a reverse proxy to access http-based applications (NodeRED, apache, wordpress, grafana) available over the internet

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
sudo apt-get -y install ansible python-apt aptitude mysql-client
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
bash run.sh
```

Note that Ansible playbooks are idempotent, meaning
that the state of system is the same the first time
you run it or subsequent times (useful if it is interrupted for some reason.)

# Services available external to Pi on the same LAN

- Node-RED http://PI_IP_ADDRESS:1880
- RealVNC (To use VNC Cloud Connect, see https://www.realvnc.com/docs/raspberry-pi.html)
- SSH
- Apache
- Wordpress

# TODO
Install and configure nginx
