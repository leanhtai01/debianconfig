#!/bin/bash

set -e

install_command="sudo apt install -y"

# update system
sudo apt update && sudo apt full-upgrade -y

$install_command firmware-iwlwifi intel-microcode firmware-realtek firmware-misc-nonfree

# ensure Vulkan and 32-bit support
$install_command mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386

# VAAPI driver
$install_command intel-media-va-driver
