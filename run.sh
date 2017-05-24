#!/bin/bash

# if you don't want to run the whole box and dice, use the tags
# eg. ansible-playbook --verbose -i hosts playbook.yml --ask-become-pass --tags=prequisites,apt

ansible-playbook --verbose -i hosts playbook.yml --ask-become-pass


