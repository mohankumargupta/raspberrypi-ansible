# Use Ubuntu computer to prepare a custom Raspbian image from a virgin Raspbian image

1. Download latest raspbian from https://www.raspberrypi.org
2. Burn onto SD card using Win32Imager or Etcher
3. Add an empty text file called ssh onto the root
   of SD card
4. Boot
5. Change IP address in hosts file in this directory
   (use Advanced IP Scanner or nmap)
6. Install ansible using ppa:ansible/ansible on ubuntu
7. Run ansible-playbook -i hosts playbook.yml --become
