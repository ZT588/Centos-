
#!/bin/bash -vf
while true;
do
IP_LIST=`cat ip`
for b in ${IP_LIST}
do
 c=$(ping -c 20 -W 1 $b| awk '$6 ~ /%/{split($6,p,"%");print p[1]}')
 if [ $c -eq 100 ];then
 n=$(mtr -c 20 $b --report) &&
 DATE=`date +%F | sed 's/-//g'``date +%T | sed 's/://g'`&&
 touch /root/mtr/$DATE-$b&&
 python  wchat.py "$b 宕机 请速速查看$n"
 echo "$n" >> /root/mtr/$DATE-$b
 echo "$b fail"
 elif [ $c -ge 50 ];then
 n=$(mtr -c 20 $b --report)
 python  wchat.py "$b 丢包 大于 50% 请速速查看$n"
 echo "$b packet loss >50%"
 elif [ $c -ge 60 ];then
 n=$(mtr -c 20 $b --report)
 python  wchat.py "$b 丢包 大于 60% 请速速查看$n"
 echo "$b packet loss > 10%"
 sleep 30
 else
 echo " $b ok"
 fi
sleep 5
  done
done
