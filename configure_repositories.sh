#!/bin/bash

set -e

current_dir=$(dirname $0)

sudo cp $current_dir/data/sources.list /etc/apt/sources.list
sudo apt update -y && sudo apt full-upgrade -y
