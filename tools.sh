vi#!/bin/bash


ipping(){
 #!/bin/bash
 echo "1.请先将要扫描的IP段保存到IP文件下。2.扫描完毕后请在workingip查看结果。本功能适合多IP段扫描"
 cd
 rm  workingip
 touch workingip

 IP_LIST=`cat ip |sed -nr 's#(.*)\..*#\1#p'`
 for i in ${IP_LIST}
 do
 #for((b=1;b<=10;i++));
 for b in {1..254};
 do
{ ping=`ping -c1 -w1 -i0.01 $i.$b > /dev/null`
if [ $? -ne 0 ];then
 echo "ping $i.$b fail"
 else
  l=$(curl -s https://ip.cn/index.php?ip=$i.$b  | awk -F ' ' '{print $4}'|awk -F '"' '{print $2}')
  echo " $i.$b     $l"  >> /root/workingip
 fi
 }&
  done
  wait
 done
}

asping(){
#!/bin/bash
echo -n "输入需要扫描的AS号（as21859）"

rm ip
touch ip
read h
yum install bgpq3 -y >/dev/null
yum install whois -y >/dev/null
bgpq3 -2 $h | awk -F " " '{print $5}' >>ip
p=$(whois -h whois.radb.net MAINT-$h | awk 'NR==2{print}' |  awk '{print $2}')
#rm /www/wwwroot/h.zqf.ink/mtr/ASPing/$h-$p.txt
mkdir /root/asping/
touch /root/asping/$h-$p.txt


 IP_LIST=`cat ip |sed -nr 's#(.*)\..*#\1#p'`
 for i in ${IP_LIST}
 do
 #for((b=1;b<=10;i++));
 for b in {1..254};

{ ping=`ping -c1 -w1 -i0.01 $i.$b > /dev/null`
if [ $? -ne 0 ];then
 echo "ping $i.$b fail"
 else
  l=$(curl -s https://ip.cn/index.php?ip=$i.$b  | awk -F ' ' '{print $4}'|awk -F '"' '{print $2}')
  echo " $i.$b            $l"  >>/root/asping/$h-$p.txt
 fi
 }&
  done
  wait
}


qa(){
#!/bin/bash
osversion=$(more /etc/redhat-release)
oscores=$(uname -a)
cpuname=$(cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c)
physical=$(cat /proc/cpuinfo | grep "physical id" | sort -u | wc -l)
processor=$(cat /proc/cpuinfo | grep "processor" | wc -l)
cpucores=$(cat /proc/cpuinfo  | grep "cpu cores" | uniq)
siblings=$(cat /proc/cpuinfo  | grep "siblings"  | uniq)
freq=$( awk -F: '/cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo | sed 's/^[ \t]*//;s/[ \t]*$//' )
memory=$(grep MemTotal /proc/meminfo)
IP=$(curl -s myip.ipip.net | awk -F ' ' '{print $2}' | awk -F '：' '{print $2}')
disk=$(df -h)

yum install mtr -y > /dev/null
yum install figlet > /dev/null

mtr=$(mtr -c 5 101.226.197.179 --report)

rm -rf qa.sh 

figlet ZENLAYER QA 

echo "=============================================================================="


echo "系统信息  OS version      :           $osversion"

echo "系统内核  OS cores        :           $oscores"

echo "CPU型号   cpu name        :           $cpuname"

echo "物理CPU数 physical id     :           $physical"

echo "逻辑CPU数 processor       :           $processor"

echo "CPU       frequency       :           $freq MHZ"

echo "CPU内核数 cpu cores       :           $cpucores"

echo "内存大小  Memory          :           $memory"

echo "IP 地址  Address          :           $IP"

echo "===================================分区信息======================================"


echo " $disk"

echo "===================================回国路由======================================"

echo "$mtr"
echo "================================================================================"
}

ipconfig(){
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
GATEWAY$j=$b.$c.$d.$f" >>/etc/sysconfig/network-scripts/ifcfg-$nic
done











else
echo faile
fi
}

iptool(){
#/bin/bash
apt install figlet > /dev/null
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
}



16bound0(){
#/bin/bash
apt install figlet > /dev/null
apt-get install ifenslave > /dev/null
modprobe bonding
cho -n "" >>/etc/network/interfaces

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
auto bond0   
iface bond0 inet static
address $num
netmask $c
gateway $g
dns-nameserver 8.8.8.8
bond-slaves $d $h     #这是三网口做bond0，具体需要看网卡名以及数量
 
auto $n
iface $n inet manual
bond-master bond0
 
auto $h
iface $h inet manual
bond-master bond0 >>/etc/network/interfaces
done
}


16bound4(){
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
}

18IP(){
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
}


18Bound4(){
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
}


ssr(){
wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/ssr.sh && chmod +x ssr.sh && bash ssr.sh
}

autossh(){
wget -N --no-check-certificate https://raw.githubusercontent.com/ZT588/Centos-/master/autossh1.0.sh && chmod +x autossh1.0.sh && bash autossh1.0.sh
}









Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m"
Green_background_prefix="\033[42;37m"
Red_background_prefix="\033[41;37m"
Font_color_suffix="\033[0m"



clear
yum install figlet -y > /dev/null

figlet NOC Tools
 echo && echo -e "一键运维脚本
 ${Green_font_prefix} 1.${Font_color_suffix} 运行  批量PING IP
 ${Green_font_prefix} 2.${Font_color_suffix} 运行  AS-PING
 ${Green_font_prefix} 3.${Font_color_suffix} 运行  Centos 批量配置IP
 ${Green_font_prefix} 4.${Font_color_suffix} 运行  Centos QA
 ${Green_font_prefix} 5.${Font_color_suffix} 运行  ubuntu16.X 批量配置IP
 ${Green_font_prefix} 6.${Font_color_suffix} 运行  ubuntu16.X 配置Bound0
 ${Green_font_prefix} 7.${Font_color_suffix} 运行  ubuntu16.X 配置Bound4
 ${Green_font_prefix} 8.${Font_color_suffix} 运行  ubuntu18.04 配置IP
 ${Green_font_prefix} 9.${Font_color_suffix} 运行  ubuntu18.04 配置Bound4
 ${Green_font_prefix} 10.${Font_color_suffix} 安装  SSR
 ${Green_font_prefix} 11.${Font_color_suffix} 批量SSH下发命令"
read -p "请输入数字 [1-9]:" numm

if [ "$numm" -eq "1" ];then
ipping

elif [ "$numm" -eq "2" ];then
asping
elif [ "$numm" -eq "3" ];then
ipconfig
elif [ "$numm" -eq "4" ];then
qa
elif [ "$numm" -eq "5" ];then
iptool
elif [ "$numm" -eq "6" ];then
16bound0
elif [ "$numm" -eq "7" ];then
16bound4
elif [ "$numm" -eq "8" ];then
18IP
elif [ "$numm" -eq "9" ];then
18Bound4
elif [ "$numm" -eq "10" ];then
ssr
elif [ "$numm" -eq "10" ];then
autossh
fi




