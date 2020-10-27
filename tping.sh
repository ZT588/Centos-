
#!/bin/bash -vf
while true;
do
IP_LIST=`cat TIP`
IFS=$(echo -en "\n\b")
for b in ${IP_LIST}
do
m=$(echo "$b"|awk -F"[ ]" '{print $2}')
f=$(echo "$b"|awk -F"[ ]" '{print $1}')
c=$(tcping $f $m | awk -F"[ ]" '{print $4}')
if [ "$c" == "open." ]; then
echo "$f TCP port $m working"
else
echo "$f TCP port $m failed"
python  wchat.py "$f TCP 端口$m 连接失败，请尽快查看！"
fi
sleep 5
  done
done
