#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
echo "ERROR:: $USERID is not a root user"
exit 1
 else
  echo "$USERID is a root user"
 fi
 #My SQL installation
yum installss mysql -y
if [ $? -ne 0 ]
then
echo "ERROR: SQL Installation failed"
exit 1 # this will stop the program execution and will not continue furthur
else
echo "SUCCESS:SQL installation completed!!!"
fi
# Post fix installation
yum install postfix -y
if [ $? -ne 0 ]
then 
   echo "ERROR: Postfix installation failed"
exit 1
else
 echo "SUCCESS:Postfix installation pass"
 fi
