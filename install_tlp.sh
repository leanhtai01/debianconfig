#!/bin/bash

set -e

install_command="sudo apt install -y"
install_command_backports="sudo apt install -y -t bullseye-backports"

$install_command tlp
$install_command acpi-call-dkms
