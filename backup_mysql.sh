#!/bin/bash

# Author: Artak Abrahamyan
# Data created: 01/07/22
# Last modified: 02.07.22

# Description
# 4.2 Backup mysql once per hour and should keep backups for last 10 days

# Usage
# backup_mysql.sh


echo "Starting MySQL backup. Please wait ..."
# New line
echo


DBNAME=`mysql -e "show databases;" | grep "DB"`
DBUSER='root'
DBPASS='mypass'
backup_path='/var/mysql_backup'

if [ -d $backup_path ];then
   continue;
else
   mkdir $backup_path;
fi

mysql_backup_file=$backup_path/site-"`date '+%d-%m-%Y'`".sql
mysqldump -u$DBUSER -p$DBPASS $DBNAME > $mysql_backup_file

gzip $backup_path/site-"`date '+%d-%m-%Y'`".sql
echo
echo '-------------------------------------------------------'
echo '------------ MySQL backup done and ziped --------------'
echo '-------------------------------------------------------'
echo

# Checking file older than 10 days if yes then delete
find $backup_path/* -mtime +10 -exec rm -r {} \;
