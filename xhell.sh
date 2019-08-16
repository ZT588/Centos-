#!/bin/bash
#
pack=1   #pack=1会话打包；
ini=tem.xsh
info=server.txt
path=./home/


while read line
do
	arr=(${line//,/ })
	name=${arr[0]}
	ip=${arr[1]}
        cp ${ini} ${path}${name}-${ip}.xsh
	sed -i 's/192.168.1.1/'$ip'/' ${path}${name}-${ip}.xsh
        #vim -c ":%s/192.168.1.1/$ip/g" -c ":x" ${path}${ip}.xsh   
        #echo "$name-$ip"
done<${info} 


if [ $pack -eq 1 ] ;then
	tar -zvcf home.tar.gz ${path} >/dev/null
fi
