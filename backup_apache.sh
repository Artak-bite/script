#!/bin/bash

# Author: Artak Abrahamyan
# Data created: 01/07/22
# Last modified: 02.07.22

# Description
# 4.1 Backup home folder NGINX 4 times a day and should keep backups for last 10 days

# Usage
# backup_apache.sh

SOURCE=/var/www/html
DEST=/var/apache_backups

# Checking folder exist ...
if [ -d $DEST ];then
   continue;
else
   mkdir $DEST;
fi

for file in $( find $SOURCE -printf "%P\n" ); do
    if [ -f "$DEST"/"$file" ]; then
        if [ "$SOURCE/$file" -nt "$DEST/$file" ]; then
	   echo
	   echo '-------------------------------------------------------'
	   echo '----------- New file detected, copying ... ------------'
	   echo '-------------------------------------------------------'
	   echo
	   cp -r $SOURCE/$file $DEST/$file
	else
           echo
           echo '-------------------------------------------------------'
           echo '------ File exists and up to date, skipping... --------'
           echo '-------------------------------------------------------'
           echo
	fi
    else
	echo
        echo '-------------------------------------------------------'
        echo '--------------- $file is copying $DEST ----------------'
        echo '-------------------------------------------------------'
        echo
       cp -r $SOURCE/$file $DEST/$file
    fi
done

#touch /etc/crontab && chmod 644 /etc/crontab
#echo "1 * * * *  tar -zcf /var/apache_backups/'$(date '+\%m-\%d-\%y').tar.gz' /var/www/html/" >> /var/spool/cron/root

# Checking file older than 10 days if yes then delete
find $DEST/* -mtime +10 -exec rm {} \;
