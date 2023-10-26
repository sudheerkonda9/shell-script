#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
echo "ERROR:: $USERID is not a root user"

# else
#  echo "$USERID is a root user"
 fi