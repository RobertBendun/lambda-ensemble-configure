#!/usr/bin/env bash

set -xe

if [ ! -f hosts ]; then
	echo "[lambda_ensamble_vm]" > hosts
	nmap -n -sn 192.168.122.0/24 -oG - | awk '/Up$/{print $2}' | grep -vE "^$(hostname -i | tr ' ' '|')\$" >> hosts
	echo "[lambda_ensamble_vm:vars]" >> hosts
	echo "ansible_user=lambda" >> hosts
	echo "ansible_become_password=ensamble" >> hosts
fi

ANSIBLE_NOCOWS=1 ansible-playbook -i hosts configure.yml -v
