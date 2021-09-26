#!/bin/bash

set -e

current_dir=$(dirname $0)
username=

. $current_dir/set_install_info.sh
. $current_dir/get_user_info.sh
$current_dir/configure_repositories.sh
$current_dir/enable_multi_arch.sh
$current_dir/install_drivers.sh
$current_dir/install_core_packages.sh
$current_dir/install_tlp.sh
$current_dir/install_gh.sh
$current_dir/install_sublime_tools.sh
$current_dir/install_LAMP.sh
$current_dir/install_vscode.sh
$current_dir/install_virtualbox.sh $username
$current_dir/install_flatpak.sh
$current_dir/install_flatpak_apps.sh
$current_dir/install_ibus-bamboo.sh
$current_dir/configure_git.sh
$current_dir/configure_editor.sh $username
$current_dir/install_google-chrome.sh
$current_dir/configure_gnome.sh
$current_dir/make_shortcuts_gnome.sh
printf "All thing done successfully!\n"
