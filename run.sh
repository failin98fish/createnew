#!/bin/bash

sudo passwd root << EOF 
857694840
857694840
EOF

echo "更改root密码"

su root << EOF 
857694840

a=`uname  -a`
 
public_string="Linux"
 
D="Darwin"
C="CentOS"
U="Ubuntu"
 

 
 
if [[ $a =~ $D ]];then
    echo "mac"
elif [[ $a =~ $C ]];then
    echo $C
    #centos os check
	FILE_EXE=/etc/redhat-release
 
	if [ -f "$FILE_EXE" ];then
		if [[ `cat /etc/redhat-release` =~ $C ]];then
			echo $C
			exit
		fi
	fi
elif [[ $a =~ $U ]];then
    echo $U
    "开始安装docker"
    sudo apt-get remove docker docker-engine docker.io containerd runc
    sudo apt-get update
    sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
  	"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  	$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
     sudo apt-get update
     sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
     echo "finished"
else
    echo $a
fi




EOF





