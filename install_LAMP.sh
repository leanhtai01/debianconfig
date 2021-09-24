#!/bin/bash

set -e

install_command="sudo apt install -y"
install_command_backports="sudo apt install -y -t bullseye-backports"

# updating system
sudo apt update && sudo apt full-upgrade

# install Apache
$install_command apache2

###################
# install MariaDB #
###################
$install_command mariadb-server expect

mysqlroot_pass1=123
mysqlroot_pass2=123

# set MySQL root's password
printf "\nSET MYSQL ROOT'S PASSWORD\n"
if [ -z $mysqlroot_pass1 ] || [ -z $mysqlroot_pass2 ] || [ $mysqlroot_pass1 != $mysqlroot_pass2 ]
then
    echo -n "Enter new MySQL root's password: "
    read -s mysqlroot_pass1
    echo -n -e "\nRetype MySQL root's password: "
    read -s mysqlroot_pass2

    while [ -z $mysqlroot_pass1 ] || [ -z $mysqlroot_pass2 ] || [ $mysqlroot_pass1 != $mysqlroot_pass2 ]
    do
	echo -e "\nSorry, passwords do not match. Please try again!"
	echo -n "Enter MySQL root's password: "
	read -s mysqlroot_pass1
	echo -n -e "\nRetype MySQL root's password: "
	read -s mysqlroot_pass2
    done
fi
echo -e "\nMySQL root's password set successfully!"

SECURE_MYSQL=$(sudo expect -c "
spawn mysql_secure_installation

expect \"Enter current password for root (enter for none):\"
send \"\r\"

expect \"Switch to unix_socket authentication\"
send \"n\r\"

expect \"Change the root password?\"
send \"y\r\"

expect \"New password:\"
send \"${mysqlroot_pass1}\r\"

expect \"Re-enter new password:\"
send \"${mysqlroot_pass1}\r\"

expect \"Remove anonymous users?\"
send \"y\r\"

expect \"Disallow root login remotely?\"
send \"y\r\"

expect \"Remove test database and access to it?\"
send \"y\r\"

expect \"Reload privilege tables now?\"
send \"y\r\"

expect eof
")

echo "${SECURE_MYSQL}"

# install PHP
$install_command php libapache2-mod-php php-gd php-mysql

# install phpmyadmin
$install_command phpmyadmin

# enable userdir
sudo a2enmod userdir
mkdir -p /home/$(whoami)/public_html

# running PHP script in user dir
begin=$(sed -n '/^<IfModule mod_userdir.c>/=' /etc/apache2/mods-available/php7.4.conf)
end=$(sed -n '/^<\/IfModule>/=' /etc/apache2/mods-available/php7.4.conf)
sudo sed -i "${begin},${end} s/^/#/" /etc/apache2/mods-available/php7.4.conf

# restart Apache
sudo systemctl restart apache2
