#!/bin/bash

set -e

install_command="apt install -y"
install_command_backports="apt install -y -t bullseye-backports"

# update system
apt update && apt full-upgrade -y

# fonts
$install_command fonts-hack

# tools
$install_command lm-sensors keepassxc

# programming
$install_command llvm clang npm build-essential git

# editor
$install_command emacs dictionaries-common
