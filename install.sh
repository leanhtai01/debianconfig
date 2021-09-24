#!/bin/bash

set -e

current_dir=$(dirname $0)

$current_dir/configure_repositories.sh
$current_dir/enable_multi_arch.sh
$current_dir/install_drivers.sh
$current_dir/install_core_packages.sh
$current_dir/install_tlp.sh
$current_dir/install_gh.sh
$current_dir/install_sublime_tools.sh
$current_dir/install_LAMP.sh
$current_dir/install_vscode.sh
$current_dir/install_virtualbox.sh
