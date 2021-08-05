#!/bin/bash

set -e

install_command="apt install -y"
install_command_backports="apt install -y -t buster-backports"

# update system
apt update && apt full-upgrade -y

# fonts
$install_command fonts-hack

# tools
$install_command lm-sensors

# programming
$install_command llvm clang npm build-essential

# editor
$install_command_backports emacs dictionaries-common
