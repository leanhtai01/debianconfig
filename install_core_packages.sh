#!/bin/bash

set -e

install_command="sudo apt install -y"
install_command_backports="sudo apt install -y -t bullseye-backports"

# update system
sudo apt update && sudo apt full-upgrade -y

# fonts
$install_command fonts-hack

# tools
$install_command lm-sensors keepassxc apt-transport-https curl expect wget krusader fish vim-gtk

# programming
$install_command llvm clang npm build-essential git

# editor
$install_command emacs dictionaries-common
