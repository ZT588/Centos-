#!/bin/bash

while true;
do

IP_LIST=`cat ip`
for b in ${IP_LIST}
do
 mkdir -p /root/mtr/$(date -d "today" +"%Y%m%d");mkdir -p /root/mtr/$(date -d "next day" +"%Y%m%d")

 basedir="/root/mtr/"
 datestr=$(date -d "today" +"%Y%m%d_%H%M%S")
 datedir=$(date -d "today" +"%Y%m%d"/)
 connect="-"
 mtr_tempfile=$basedir$datedir$b$connect${datestr}.txt

 c=$(ping -c 20 -W 1 $b| awk '$6 ~ /%/{split($6,p,"%");print p[1]}')
 if [ $c -eq 100 ];then
 n=$(mtr -c 20 $b --report) &&


 python  wchat.py "$b 宕机 请速速查看$n"
 touch $mtr_tempfile
 echo "$n" >> $mtr_tempfile
 echo "$b fail"
 elif [ $c -ge 20 ];then
 n=$(mtr -c 20 $b --report)
 python  wchat.py "$b 丢包 大于 20% 请速速查看$n"
 echo "$b packet loss >10%"
 touch $mtr_tempfile
 echo "$n" >> $mtr_tempfile
 elif [ $c -ge 10 ];then
 n=$(mtr -c 20 $b --report)
 python  wchat.py "$b 丢包 大于 10% 请速速查看$n"
 echo "$b packet loss > 10%"
 touch $mtr_tempfile
 echo "$n" >> $mtr_tempfile
 sleep 30
 else
 echo " $b ok"
 fi
sleep 5
  done

done

