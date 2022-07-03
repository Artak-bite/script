#!/bin/bash

# Author: Artak Abrahamyan
# Data created: 01/07/22
# Last modified: 03.07.22

# Description
# Set mysql default conf ...

# Usage
# mysql.sh


# create password and DB
ROOTPASWD='mypass'

mysql -uroot -e 'UPDATE mysql.user SET authentication_string=null WHERE User="root";'
mysql -uroot -e 'FLUSH PRIVILEGES;'
mysql -uroot -e exit;
mysql -uroot -e 'ALTER USER root@localhost IDENTIFIED WITH caching_sha2_password BY "mypass";'
mysql -uroot -p$ROOTPASWD -e 'CREATE DATABASE DB /*\!40100 DEFAULT CHARACTER SET utf8 */;'
mysql -uroot -p$ROOTPASWD -e 'CREATE USER DB@localhost IDENTIFIED BY "mypass";'
mysql -uroot -p$ROOTPASWD -e 'GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO DB@localhost;'
mysql -uroot -p$ROOTPASWD -e 'FLUSH PRIVILEGES;'
