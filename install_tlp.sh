#!/bin/bash

set -e

install_command="apt install -y"
install_command_backports="apt install -y -t bullseye-backports"

$install_command tlp
$install_command acpi-call-dkms
