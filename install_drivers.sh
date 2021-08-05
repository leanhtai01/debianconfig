#!/bin/bash

set -e

install_command="apt install -y"

# update system
apt update && apt full-upgrade -y

$install_command firmware-iwlwifi intel-microcode firmware-realtek firmware-misc-nonfree

# ensure Vulkan and 32-bit support
$install_command mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386

# VAAPI driver
$install_command intel-media-va-driver
