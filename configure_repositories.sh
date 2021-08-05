#!/bin/bash

set -e

current_dir=$(dirname $0)

cp $current_dir/data/sources.list /etc/apt/sources.list
apt update -y && apt full-upgrade -y
