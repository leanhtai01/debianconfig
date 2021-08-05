#!/bin/bash

set -e

install_command="apt install -y"
install_command_backports="apt install -y -t buster-backports"

$install_command_backports tlp
$install_command acpi-call-dkms
