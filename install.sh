#!/bin/bash

set -e

current_dir=$(dirname $0)

$current_dir/configure_repositories.sh
$current_dir/install_drivers.sh
$current_dir/install_core_packages.sh
