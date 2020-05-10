#/bin/bash              
echo "**此脚本使用于ubuntu18.04配置主IP，需要手动输入IP，网关，网卡信息**"
echo -n "IPaddress(192.168.1/30):"
read num
echo -n "Gateway:"
read g
echo -n "NIC Name(eth0):"
read d
m=$(find  /etc/netplan | grep .*yaml)

  echo "
network:
  version: 2
  renderer: networkd
  ethernets:
    
    $d:
      dhcp4: no
      dhcp6: no
      addresses: [$num]
      gateway4: $g
      nameservers:
        addresses: [8.8.8.8,8.8.4.4]" >>$m
