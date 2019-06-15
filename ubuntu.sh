#/bin/bash
apt install figlet
figlet ZENLAYER
echo "**此脚本使用于ubuntu配置多个IP，需要手动输入网络位，掩码，网关，网卡信息**"

echo -n "网络位(192.168.1):"
read num


echo -n "起始IP(2):"
read a

echo -n "结束IP(254):"
read b

echo -n "掩码(255.255.255.0):"
read c

echo -n "网关(最后一位):"
read g

echo -n "网卡名(eth0):"
read d
echo -n "IP排序(如果是多ip段，此数字不能重复使用):"
read h
for((i=a,j=h;i<=b;i++,j++))



do

  echo "
auto $d:$j
iface $d:$j inet static
address $num.$i
netmask $c
gateway $num.$g" >>/etc/network/interfaces
done
