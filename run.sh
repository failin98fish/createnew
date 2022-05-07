#!/bin/bash

sudo passwd root << EOF 
857694840
857694840
EOF

echo "更改root密码"

cp -r

a=`uname  -a`
public_string="Linux"
 
D="Darwin"
C="CentOS"
U="Ubuntu"

 
#centos os check
FILE_EXE=/etc/redhat-release
 
if [ -f "$FILE_EXE" ];then
	if [[ `cat /etc/redhat-release` =~ $C ]];then
		echo $C
		echo "开始安装docker"
    yum -y install docker
    yum install docker-compose

    systemctl start docker
    systemctl enable docker
    docker pull portainer/portainer
    docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /root/portainer:/data portainer/portainer
    echo "finished"
		exit
	fi
fi
 
 
if [[ $a =~ $D ]];then
    echo "mac"
elif [[ $a =~ $C ]];then
    echo $C
elif [[ $a =~ $U ]];then
    echo $U
    echo "开始安装docker"
    sudo apt install docker
    sudo apt install docker-compose
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo docker pull portainer/portainer
    sudo docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /root/portainer:/data portainer/portainer
    echo "finished"
else
    echo $a
fi
