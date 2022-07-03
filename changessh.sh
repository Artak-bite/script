#!/bin/bash

# Author: Artak Abrahamyan
# Data created: 01/07/22
# Last modified: 02.07.22

# Description
# 2. Change SSH default port to 2234

# Usage
# changessh.sh


# Changing ssh port
LINE=/etc/ssh/sshd_config
CATCH=`cat $LINE | grep "Port 2234"`

if [ "$CATCH" != "Port 2234" ]; then
    echo "Port 2234" >> $LINE
    echo
    echo '-------------------------------------------------------'
    echo '---------- SSH port is successfully changed -----------'
    echo '-------------------------------------------------------'
    echo
else
    echo
    echo '-------------------------------------------------------'
    echo '-------------- SSH Port already changed ---------------'
    echo '-------------------------------------------------------'
    echo
fi

# Restart ssh service
systemctl restart sshd
