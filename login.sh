#!/bin/sh
# Date  : 2018-09-14 14:56:09
# Author: b4zinga
# Email : b4zinga@outlook.com
# Func  : 批量登陆Linux主机并执行命令

username="root"
password="123456"
port="22"
timeout=3

cmd="mkdir 20200319"

login(){
    echo ""
    echo "-------------------------------------------------------- "
    echo "username: $username  password: $password  port: $port  timeout=$timeout"
    echo "command: $cmd"
    echo "Remote exec command script"
    echo "--------------------------------------------------------"
    echo ""


    for host in `cat ip.txt`;
    do
        result=""
        result=`sshpass -p "$password" ssh -p $port -o StrictHostKeyChecking=no -o ConnectTimeout=$timeout $username@$host $cmd`
        echo $host >> result.txt
        echo $result >> result.txt

    done
    echo ""
}

login
ls
