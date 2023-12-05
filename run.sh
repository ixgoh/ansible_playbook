#!/bin/bash

set -euo pipefail

read -p 'Target Hostname: ' hostname
read -p 'Target Username: ' username
read -sp 'Target Password: ' password
echo

sed -i -e "s/^\(.*\) ansible_user/$hostname ansible_user/" \
       -e "s/ansible_user=[^[:space:]]*/ansible_user=$username/" \
       -e "s/ansible_password=[^[:space:]]*/ansible_password=$password/" \
       -e "s/ansible_become_password=[^[:space:]]*/ansible_become_password=$password/" inventory

sudo apt update && sudo apt install -y python3-pip sshpass
pip3 install ansible
$HOME/.local/bin/ansible-galaxy install -r requirements.yml
$HOME/.local/bin/ansible-playbook -i inventory main.ansible.yml
