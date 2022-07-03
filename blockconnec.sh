#!/bin/bash

# Author: Artak Abrahamyan
# Data created: 01/07/22
# Last modified: 02.07.22

# Description
# 3. Add rule that block all requests to all ports except web servers from external IPs (not DHCP range)

# Usage
# blockconnec.sh

#Installing iptables
apt install iptables -y

# reject packets for other users
iptables -A OUTPUT -j REJECT

# Allow local connections
iptables -A OUTPUT -d 127.0.0.1 -j ACCEPT
iptables -A OUTPUT -d 192.168.0.0/16 -j ACCEPT
