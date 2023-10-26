#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
echo "ERROR:: $USERID is not a root user"
exit 1
 else
  echo "$USERID is a root user"
 fi
yum install mysql -y

if [ $? -ne 0 ]
then
echo "ERROR: SQL Installation failed"
#exit 1
else
echo "SUCCESS:SQL installation completed!!!"
fi