# Use Ubuntu computer to prepare a custom Raspbian image from a virgin Raspbian image


## On the Raspberry Pi (target device)
1. Download latest raspbian from https://www.raspberrypi.org
2. Burn onto SD card using Win32Imager or Etcher
3. Add an empty text file called ssh onto the root
   of SD card
4. Boot

## On a computer running Ubuntu (host computer)

4. Download this repo onto the computer
   - git clone https://github.com/mohankumargupta/raspberrypi-ansible.git

     cd raspberrypi-ansible
     
5. Change IP address in hosts file in this directory
   (use Advanced IP Scanner or nmap)
6. Install ansible using ppa:ansible/ansible on ubuntu
7. Setup ssh keyless login with Raspberry Pi target (ssh-keygen, ssh-copy-id)
8. Run ansible-playbook -i hosts playbook.yml
