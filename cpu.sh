#!/bin/bash
osversion=$(more /etc/redhat-release)
oscores=$(uname -a)
cpuname=$(cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c)
physical=$(cat /proc/cpuinfo | grep "physical id" | sort -u | wc -l)
processor=$(cat /proc/cpuinfo | grep "processor" | wc -l)
cpucores=$(cat /proc/cpuinfo  | grep "cpu cores" | uniq)
siblings=$(cat /proc/cpuinfo  | grep "siblings"  | uniq)
memory=$(grep MemTotal /proc/meminfo)

disk=$(df -h)

yum install mtr -y


mtr=$(mtr -c 5 101.226.197.179 --report)


echo "================================= NOC QA REPORT================================"


echo "系统信息 OS version       :           $osversion"

echo "系统内核 OS cores         :           $oscores"

echo "CPU型号 cpu name          :           $cpuname"

echo "物理CPU数physical id      :           $physical"

echo "逻辑CPU数processor        :           $processor"

echo "CPU内核数cpu cores        :           $cpucores"

echo "内存大小  Memory          :           $memory"

echo "===================================分区信息======================================"


echo " $disk"

echo "===================================回国路由======================================"

echo "$mtr"
