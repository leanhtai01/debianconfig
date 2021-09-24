#!/bin/bash

set -e

sudo dpkg --add-architecture i386
sudo apt update && sudo apt full-upgrade -y
