# Start with a vanilla Raspbian image, end up with a turbocharged custom Raspbian image 

## How it works
* Boot Raspberry Pi with a fresh install of Raspbian (remember to put an empty file called ssh in the root
of SD card to enable SSH, and optionally a wpa_supplicant.conf to automatically connect to wifi if running headless, see wpa_supplicant-sample.conf for an example)
* Need to setup a computer running Ubuntu/Linux Mint. It runs an Ansible script which
will create your custom Raspbian image. Need to edit 2 user config files.


## User configuration files
**hosts**: Change IP address of Pi and optionally hostname

**group_vars/raspberrypis.yml**: Lots of stuff like software to install, nodered modules to install, enable camera etc.

## Features

- Change hostname and password for user called pi
- Configure keyboard layout
- Install an on-screen keyboard
- Configures raspi-config, including VNC,camera
- Install software of your choice including  Arduino IDE, audacity, vlc through apt-get
- Updates NodeJS and NodeRed
- Installs NodeRED modules
- Installs ngrok to allow webserver access over the internet
- Installs docker and starts docker containers (see docker-compose.yml)
- Install and configure SAMBA


# Detailed Instructions

## On the Raspberry Pi (target device)
1. Download latest raspbian from https://www.raspberrypi.org
2. Burn onto SD card using Win32Imager or Etcher
3. Add an empty text file called ssh onto the root of SD card
4. Boot

## On a computer running Ubuntu (host computer)

5. Install Ansible 
```sh
sudo add-apt-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get -y install ansible git
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

Be patient, it can take up to 1hr to complete.

Note that Ansible playbooks are idempotent, meaning that the state of system is the same the first time you run it or subsequent times (take with a grain of salt). 

## Troubleshooting/Tips
- If the above script (bash run.sh) hangs or is interrupted for whatever reason, just re-run it again. It will skip over the bits it's already done, and push ahead.
- You only need to do the ssh-keygen command one-time on the Control Ubuntu PC for a particular user on that system.   
- If you get a MAN IN THE MIDDLE error when doing the 
ssh-copy-id command, it means you have done the SSH keyless exchange with a previous raspbian install, just type the command recommended in the error message.

# Services available external to Pi on the same LAN

Once the above commands have been run, on the pi
you can go to http://localhost or on another machine on the same network, go to http://PI_IP_ADDRESS to get a 
list of web-based services available on the Pi.


