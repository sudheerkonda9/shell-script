#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with root user $N"
    exit 1
# else 
# echo "USER is a Root User"
fi

#All args are in $@

for i in $@
do
    yum install $i -y
done