#!/usr/bin/env bash

set -xe

# TODO: Move to .env file
REMOTE_NETWORK="192.168.1.0/24"
REMOTE_USER="lambda"
REMOTE_USER_BECOME_PASSWORD="12341234"

echo "[lambda_ensamble_vm]" > hosts
nmap -n -sn "${REMOTE_NETWORK}" -oG - | awk '/Up$/{print $2}' | grep -vE "^($(hostname -i | tr ' ' '|'))\$" >> hosts
echo "[lambda_ensamble_vm:vars]" >> hosts
echo "ansible_user=${REMOTE_USER}" >> hosts
echo "ansible_become_password=${REMOTE_USER_BECOME_PASSWORD}" >> hosts

