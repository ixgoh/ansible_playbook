#!/bin/bash

read -p 'Target Hostname: ' hostname
read -p 'Target Username: ' username
read -sp 'Target Password: ' password
echo
sed -i "s/hostname/$hostname/g" inventory2
sed -i "s/my_user/$username/g" inventory2
sed -i "s/my_password/$password/g" inventory2
sudo apt update && sudo apt install -y python3-pip sshpass
pip3 install ansible
$HOME/.local/bin/ansible-galaxy install -r requirements.yml
$HOME/.local/bin/ansible-playbook -i inventory main.ansible.yml
