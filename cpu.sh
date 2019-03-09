#/bin/bash


echo "=========Zenlayer QA  Report =========================================="
more /etc/redhat-release 
uname -a
echo "====================================================================="
cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c
echo " physical id"
cat /proc/cpuinfo |grep "physical id"|sort |uniq|wc -l
echo "======================================================================="
df -h

echo "======================================================================="
grep MemTotal /proc/meminfo
dmidecode|grep -P -A5 "Memory\s+Device"|grep Size|grep -v Range
echo "======================================================================="

rm cpu.sh -y
