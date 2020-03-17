#!/bin/bash
HOST=$(cat /etc/network/interfaces | awk '{print $2}'| sed -n "11, 1p")
sed -i '1d' /etc/hostname
echo $HOST >  /etc/hostname
