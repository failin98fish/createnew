#!/bin/bash

sudo passwd root << EOF 
857694840
857694840
EOF

echo "更改root密码"

su root << EOF 
857694840
EOF




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
		exit
	fi
fi
 
 
if [[ $a =~ $D ]];then
    echo "mac"
elif [[ $a =~ $C ]];then
    echo $C
elif [[ $a =~ $U ]];then
    echo $U
else
    echo $a
fi
