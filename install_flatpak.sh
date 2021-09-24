#!/bin/bash

set -e

install_command="sudo apt install -y"
install_command_backports="sudo apt install -y -t bullseye-backports"

# update system
sudo apt update && sudo apt full-upgrade -y

$install_command flatpak gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
