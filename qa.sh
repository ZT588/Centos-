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

yum install mtr -y


mtr=$(mtr -c 5 101.226.197.179 --report)

rm qa.sh -y

echo "================================= NOC QA REPORT================================"


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
