#!/bin/bash

set -e

install_command="sudo apt install -y"
install_command_backports="sudo apt install -y -t bullseye-backports"

# update system
sudo apt update && sudo apt full-upgrade -y

flatpak update
flatpak install com.belmoussaoui.Authenticator -y
flatpak install com.getferdi.Ferdi -y
