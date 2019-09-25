#!/bin/bash

yum install figlet > /dev/null

figlet IPCONFIG TOOL

echo "适用一下掩码 /30 /29 /28 /27 /26 /25 /24 "



echo -n " 请输入IP以及掩码(10.1.1.0/24)"
read a
b=$(echo "$a" | awk -F "." '{print $1}')
c=$(echo "$a" | awk -F "." '{print $2}')
d=$(echo "$a" | awk -F "." '{print $3}')
e=$(echo "$a" | awk -F "." '{print $4}'| awk -F "/" '{print $1}')
g=$(echo "$a" | awk -F "/" '{print $2}')

echo -n "输入起始IP个数（IPADDR2）"
read h

echo -n "请输入网卡名（eth0）"
read nic

if [ $g -eq 29 ];then
mask=255.255.255.248
f=$(($e+1))
m=$(($f+1))
v=$(($m+5))
for ((i=m,j=h; i<v; i ++,j++)) 
do
 echo "
IPADDR$j=$b.$c.$d.$i
NETMASK$j=$mask
GATEWAY$j=$b.$c.$d.$f" >>/etc/sysconfig/network-scripts/ifcfg-$nic
done


elif [ $g -eq 28 ];then
mask=255.255.255.240
f=$(($e+1))
m=$(($f+1))
v=$(($m+13))
for ((i=m,j=h; i<v; i ++,j++))
do
echo "
IPADDR$j=$b.$c.$d.$i
NETMASK$j=$mask
GATEWAY$j=$b.$c.$d.$f" >>/etc/sysconfig/network-scripts/ifcfg-$nic
done


elif [ $g -eq 27 ];then
mask=255.255.255.224
f=$(($e+1))
m=$(($f+1))
v=$(($m+29))
for ((i=m,j=h; i<v; i ++,j++))
do
echo "
IPADDR$j=$b.$c.$d.$i
NETMASK$j=$mask
GATEWAY$j=$b.$c.$d.$f" >>/etc/sysconfig/network-scripts/ifcfg-$nic
done




elif [ $g -eq 30 ];then
mask=255.255.255.252
f=$(($e+1))
m=$(($f+1))
v=$(($m+1))
for ((i=m,j=h; i<v; i ++,j++))
do
echo "
IPADDR$j=$b.$c.$d.$i
NETMASK$j=$mask
GATEWAY$j=$b.$c.$d.$f" >>/etc/sysconfig/network-scripts/ifcfg-$nic
done


elif [ $g -eq 26 ];then
mask=255.255.255.192
f=$(($e+1))
m=$(($f+1))
v=$(($m+61))
for ((i=m,j=h; i<v; i ++,j++))
do
echo "
IPADDR$j=$b.$c.$d.$i
NETMASK$j=$mask
GATEWAY$j=$b.$c.$d.$f" >>/etc/sysconfig/network-scripts/ifcfg-$nic
done


elif [ $g -eq 25 ];then
mask=255.255.255.128
f=$(($e+1))
m=$(($f+1))
v=$(($m+125))
for ((i=m,j=h; i<v; i ++,j++))
do
echo "
IPADDR$j=$b.$c.$d.$i
NETMASK$j=$mask
GATEWAY$j=$b.$c.$d.$f" >>/etc/sysconfig/network-scripts/ifcfg-$nic
done


elif [ $g -eq 24 ];then
mask=255.255.255.0
f=$(($e+1))
m=$(($f+1))
v=$(($m+253))
for ((i=m,j=h; i<v; i ++,j++))
do
echo "
IPADDR$j=$b.$c.$d.$i
NETMASK$j=$mask
GATEWAY$j=128.1.84.241" >>/etc/sysconfig/network-scripts/ifcfg-$nic
done











else
echo faile
fi
