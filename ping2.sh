
 #!/bin/bash
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
  l=$(curl -s https://ip.cn/index.php?ip=$i.$b  | awk -F ' ' '{print $4}')
  echo " $i.$b     $l"  >> /root/2019-08-01/workingip
 fi
 }&
  done
  wait
 c=$(head -n 154 workingip)
 python  /root/wchat.py "$c"
 python  /root/wchat.py IP扫描结束，请查看结果
 done
~       
