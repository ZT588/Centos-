#!/bin/bash

yum -y install net-tools >>/dev/null

echo "*******Centos7 双网卡修改网卡名******Power by todd.zhang**********"

interface1=`ls /sys/class/net|grep en|awk 'NR==1{print}'`
interface2=`ls /sys/class/net|grep en|awk 'NR==2{print}'`

echo -n "will change to $interface1 : "
read nic1
echo -n "will change to $interface2 : "
read nic2


echo $interface1 will change to $nic1
echo $interface2 will change to $nic2

interface_file1="/etc/sysconfig/network-scripts/ifcfg-$interface1"
interface_file2="/etc/sysconfig/network-scripts/ifcfg-$interface2"

mac1=`ifconfig $interface1 |egrep "ether" |awk '{print $2}'`
mac2=`ifconfig $interface2 |egrep "ether" |awk '{print $2}'`

sed -i "s/$interface1/$nic1/" $interface_file1
sed -i "s/$interface2/$nic2/" $interface_file2

mv $interface_file1 /etc/sysconfig/network-scripts/ifcfg-$nic1
mv $interface_file2 /etc/sysconfig/network-scripts/ifcfg-$nic2


sed -i '$a \SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="mac1", ATTR{type}=="1" , NAME="nic1"' /usr/lib/udev/rules.d/60-net.rules
sed -i '$a \SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="mac2", ATTR{type}=="1" , NAME="nic2"' /usr/lib/udev/rules.d/60-net.rules

sed -i "s/mac1/$mac1/"  /usr/lib/udev/rules.d/60-net.rules

sed -i "s/mac2/$mac2/"  /usr/lib/udev/rules.d/60-net.rules


sed -i "s/nic1/$nic1/"  /usr/lib/udev/rules.d/60-net.rules

sed -i "s/nic2/$nic2/"  /usr/lib/udev/rules.d/60-net.rules

echo "The nic name has been changed , please reboot the server."
