#!/bin/sh

echo "1.提前创建ip.txt写入IP。2.创建result.txt"
echo -n "输入密码:"
read password
echo -n "输入端口号"
read port
username="root"
#password="V1gzngilpBluf0t@"
#port="22"
timeout=3
echo -n "远程执行命令:"
read cmd

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
cat result.txt
#ls
