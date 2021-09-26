#!/bin/bash

set -e

username=

. ../set_install_info.sh
adduser $username sudo
