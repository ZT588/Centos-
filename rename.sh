#!/bin/bash

yum -y install net-tools >>/dev/null

interface1=`ls /sys/class/net|grep en|awk 'NR==1{print}'`
interface2=`ls /sys/class/net|grep en|awk 'NR==2{print}'`


interface_file1="/etc/sysconfig/network-scripts/ifcfg-$interface1"
interface_file2="/etc/sysconfig/network-scripts/ifcfg-$interface2"

mac1=`ifconfig $interface1 |egrep "ether" |awk '{print $2}'`
mac2=`ifconfig $interface2 |egrep "ether" |awk '{print $2}'`

sed -i "s/$interface1/wan0/" $interface_file1
sed -i "s/$interface2/lan0/" $interface_file2

mv $interface_file1 /etc/sysconfig/network-scripts/ifcfg-wan0
mv $interface_file2 /etc/sysconfig/network-scripts/ifcfg-lan0


sed -i '$a \SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="$mac1", ATTR{type}=="1" , NAME="wan0"' /usr/lib/udev/rules.d/60-net.rules
sed -i '$a \SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="$mac2", ATTR{type}=="1" , NAME="lan0"' /usr/lib/udev/rules.d/60-net.rules

sed -i "s/mac1/$mac1/"  /usr/lib/udev/rules.d/60-net.rules

sed -i "s/mac1/$mac2/"  /usr/lib/udev/rules.d/60-net.rules
