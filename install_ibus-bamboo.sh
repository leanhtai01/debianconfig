#!/bin/bash

set -e

install_command="sudo apt install -y"
install_command_backports="sudo apt install -y -t bullseye-backports"

# update system
sudo apt update && sudo apt full-upgrade -y

# install curl before use
$install_command curl

echo 'deb http://download.opensuse.org/repositories/home:/lamlng/Debian_10/ /' | sudo tee /etc/apt/sources.list.d/home:lamlng.list
curl -fsSL https://download.opensuse.org/repositories/home:lamlng/Debian_10/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_lamlng.gpg > /dev/null
sudo apt update
$install_command ibus-bamboo

ibus restart
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"
gsettings set org.gnome.desktop.interface gtk-im-module "'ibus'"
