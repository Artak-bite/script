#!/bin/bash

# Author: Artak Abrahamyan
# Data created: 01/07/22
# Last modified: 03.07.22

# Description
# 1. Install apache2, php, mysql

# Usage
# script.sh, index.php


apt update

# Installing apache web server
apt install apache2 -y

# Installing mysql db
apt install mysql-server mysql-client -y

# Installing php and moduls
apt install php-pear php-dev php-zip php-curl php-xmlrpc php-gd php-mysql php-mbstring php-xml libapache2-mod-php -y

# Install adminer
apt install adminer -y
a2enconf adminer.conf

# Restarting services
systemctl restart apache2
systemctl restart mysql.service

# Enable services
systemctl enable apache2
systemctl enable mysql.service

# New line
echo
echo '-------------------------------------------------------'
echo '----------- Checking status of the services -----------'
echo '-------------------------------------------------------'
echo Apache service is $(systemctl show -p ActiveState --value apache2)
echo MySql service is $(systemctl show -p ActiveState --value mysql)
# New line
echo

# Copy index.php to .../html folder and get permissions
chown -R $USER:$USER /var/www/

# Variables
FILE1=/var/www/html/index.html
FILE2=/var/www/html/index.php

if [ -f "$FILE1" ]; then
   rm -r $FILE1
else
   continue;
fi

chown -R $USER:$USER /etc/apache2/
if [ -f $FILE2 ]; then
    if [ index.php -nt "$FILE2" ]; then
	echo "-------------------------------------------------------"
        echo "-------- New index.php file detected copying ----------"
        cat index.php > $FILE2;
        echo "-------------------------------------------------------"
	echo
    else
	echo "-------------------------------------------------------"
        echo "----------- index.php file is up to date --------------"
	echo "-------------------------------------------------------"
	echo
    fi
else
    echo "-------------------------------------------------------"
    echo "-------------- Copy index.php in $FILE2 ---------------"
    cat index.php > $FILE2;
    echo "-------------------------------------------------------"
    echo
fi
