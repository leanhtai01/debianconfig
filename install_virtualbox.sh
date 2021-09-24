#!/bin/bash

set -e

install_command="sudo apt install -y"
install_command_backports="sudo apt install -y -t bullseye-backports"

# import fasttrack archive keyring
$install_command fasttrack-archive-keyring

# setup fasttrack repositories
printf "\n# fasttrack repositories\n" | sudo tee -a /etc/apt/sources.list
printf "deb https://fasttrack.debian.net/debian-fasttrack/ bullseye-fasttrack main contrib\n" | sudo tee -a /etc/apt/sources.list
printf "deb https://fasttrack.debian.net/debian-fasttrack/ bullseye-backports-staging main contrib\n" | sudo tee -a /etc/apt/sources.list

# install virtualbox
$install_command virtualbox virtualbox-ext-pack
