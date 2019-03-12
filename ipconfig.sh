#/bin/bash

echo "**此脚本使用于centos配置多个IP，需要手动输入网络位，掩码，网关，网卡信息**"

echo -n "网络位:(192.168.1)"
read num


echo -n "起始IP:(1)"
read a

echo -n "结束IP:(254)"
read b

echo -n "掩码:(255.255.255.0)"
read c

echo -n "网关(最后一位):"
read g

echo -n "网卡名:"
read d
for((i=a;i<=b;i++))



do

  echo "
IPADDR$i=$num.$i
NETMASK$i=$c
GATEWAY$i=$num.$g" >>/etc/sysconfig/network-scripts/ifcfg-$d


done
