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
echo "Installation.......FAILED"
exit 1
else
echo "Installation.......PASSED"
fi
}
 #My SQL installation
yum installss mysql -y

VALIDATE $?

# Post fix installation
yum installss postfix -y

VALIDATE $?


