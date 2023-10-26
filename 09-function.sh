#!/bin/bash
USERID=$(id -u)
#This function should validate the previos command and inform user about Pass/fail

if [ $USERID -ne 0 ]
then 
echo "ERROR:: $USERID is not a root user"
exit 1
 else
  echo "$USERID is a root user"
 fi

 VALIDATE () {

if [ $1 -ne 0 ]
then
echo "$2.......FAILED"
exit 1
else
echo "$2.......SUCCESS"
fi
}
 #My SQL installation
yum install mysql -y

VALIDATE $? "MYSQL Installation"

# Post fix installation
yum instals postfix -y

VALIDATE $? "POSTFIX Installation"


