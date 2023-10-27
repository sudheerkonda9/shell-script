#!/bin/bash

DATE=$(date +%F)
SCRIPTNAME=$0
LOGSPATH=/home/centos/shellscript-logs
LOGFILE=$LOGSPATH/$SCRIPTNAME-$DATE.log
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo -e "ERROR::$2 installation $R FAILED $N"
    exit
    else
    echo -e "SUCCESS::$2 installation $G PASSED $N"
    fi
}

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
    yum list installed $i &>>$LOGFILE
if [ $? -ne 0 ]
then
   echo "$i Package is not installed, Lets install $i package"
   yum install $i -y &>>$LOGFILE
   VALIDATE $? "$i"
   else
   echo -e "$Y $i Package already installed $N"
fi

done