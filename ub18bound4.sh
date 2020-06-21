#/bin/bash              
echo "**此脚本使用于ubuntu18.04配置主IP，需要手动输入IP，网关，网卡信息**"
echo -n "IPaddress(192.168.1/30):"
read num
echo -n "Gateway:"
read g
echo -n "NIC Name(eth0):"
read d
m=$(find  /etc/netplan | grep .*yaml)
echo -n "" >>$m

  echo "
network:
    renderer: NetworkManager
    ethernets:
        eth1：
            dhcp:no
        eth2:
            dhcp:no
    version: 2
    bonds:
        bond0:
            interfaces:[eth1,eth2]
            addresses:[$num] 
            gateway: $g
            nameservers:
                addresses: [8.8.8.8, 8.8.4.4]
            parameters:
                mode:4
                lacp-rate:fast
                mii-monitor-interval:100" >>$m
