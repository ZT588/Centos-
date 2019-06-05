#!/bin/bash

echo -n "网络位(192.168.1):"
read n

for ((i=1;i<=254; i++))
do
ping=`ping -c 1 $n.$i > /dev/null`
if [ $? -ne 0 ];then
echo "ping $i fail" > /dev/null
else
echo "ping $n.$i ok"
fi
done
