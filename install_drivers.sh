#!/bin/bash

set -e

apt update -y && apt full-upgrade -y && apt install -y firmware-iwlwifi intel-microcode firmware-realtek firmware-misc-nonfree
