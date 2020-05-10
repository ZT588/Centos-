#/bin/bash              
echo "**此脚本使用于ubuntu18.04配置主IP，需要手动输入IP，网关，网卡信息**"
echo -n "IP地址(192.168.1/30):"
read num
echo -n "网关:"
read g
echo -n "网卡名(eth0):"
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
