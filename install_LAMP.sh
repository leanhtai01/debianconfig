#!/bin/bash

set -e

install_command="sudo apt install -y"
install_command_backports="sudo apt install -y -t bullseye-backports"

# updating system
sudo apt update && sudo apt full-upgrade

# install Apache
$install_command apache2

# install MariaDB
$install_command mariadb-server

# install PHP
$install_command php libapache2-mod-php php-gd php-mysql

# install phpmyadmin
$install_command phpmyadmin

# enable userdir
sudo a2enmod userdir
mkdir -p /home/$(whoami)/public_html
