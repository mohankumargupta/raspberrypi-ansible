#!/bin/bash

ANSIBLE_ROLES_PATH=$(pwd)/roles
export ANSIBLE_ROLES_PATH
mkdir -p $ANSIBLE_ROLES_PATH
ansible-galaxy install geerlingguy.apache
ansible-galaxy install geerlingguy.mysql
ansible-galaxy install geerlingguy.php
ansible-playbook --verbose -i hosts playbook.yml
