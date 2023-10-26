#!/bin/bash

DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE () {
if [ $1 -ne 0 ]
then
echo -e "$2....... $R FAILED $N"
exit 1
else
echo -e "$2....... $G SUCCESS $N"
fi
}

USERID=$(id -u)
#This function should validate the previos command and inform user about Pass/fail
if [ $USERID -ne 0 ]
then 
echo "ERROR:: $USERID is not a root user"
exit 1
 else
  echo "$USERID is a root user"
 fi

 #My SQL installation
yum install mysql -y &>>$LOGFILE

VALIDATE $? "MYSQL Installation"

# Post fix installation
yum installdf postfix -y &>>$LOGFILE

VALIDATE $? "POSTFIX Installation"


