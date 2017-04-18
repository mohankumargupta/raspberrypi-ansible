1. Download latest raspbian from https://www.raspberrypi.org
2. Burn onto SD card using Win32Imager or the new one
3. add an empty text file called ssh onto the root
   of SD card
4. Boot
5. Change IP address in host file in this directory
   (use Advanced IP Scanner or nmap)
6. Run ansible-playbook -i hosts playbook.yml --become