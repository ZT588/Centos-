#/bin/bash
apt install figlet > /dev/null
apt-get install ifenslave > /dev/null
modprobe bonding
echo "rtc" >>/etc/moduleslp
echo "bonding" >>/etc/moduleslp

echo -n "" >>/etc/network/interfaces

figlet ZENLAYER
echo "**此脚本使用于ubuntu配置Bound0，需要手动输入网络位，掩码，网关，网卡信息**"

echo -n "IP 地址(192.168.1.2):"
read num


echo -n "掩码(255.255.255.0):"
read c

echo -n "网关(192.168.1.1):"
read g

echo -n "网卡名1(eth0):"
read d
echo -n "网卡名(eth1):"
read h


  echo "
auto bond0    #创建以Bond0命名的网卡
    address $num
    gateway $g
    netmask $c
    bond-mode 4
    bond-miimon 100
    bond-lacp-rate 1
    bond-xmit_hash_policy 1
    bond-slaves $d $h
 
 
auto $d
iface $d inet manual
bond-master bond0
 
auto $h
iface $h inet manual
bond-master bond0 >>/etc/network/interfaces
done
