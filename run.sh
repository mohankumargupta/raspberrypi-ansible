#!/bin/bash

# if you don't want to run the whole box and dice, use the tags
#   ansible-playbook --verbose -i hosts playbook.yml --ask-become-pass --tags=prequisites,apt
# also
#   ansible-playbook --verbose -i hosts playbook.yml --ask-become-pass --skip-tags=apt  


ansible-playbook --verbose -i hosts playbook.yml --ask-become-pass
#ansible-playbook --verbose -i hosts playbook.yml --extra-vars="ansible_become_pass=Kiac##44"


