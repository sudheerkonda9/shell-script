#!/bin/bash

LOGFILE_DIRECTORY=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIRECTORY/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=1
message=""


#"IFS= " Internal field seperator is space
while IFS= read line
do 
#df -hT | grep -vE 'tmpfs|Filesystem' | awk '{print $6}' | cut -d% -f1
#below command will give you usage in number format
 usage=$(echo $line | awk '{print $6}' | cut -d% -f1 )
 # I need partition also , below command will give us partition
 partition=$(echo $line | awk '{print $1}')

#now you need to check whther it is more than threshold or not
   if [ $usage -gt $DISK_USAGE_THRESHOLD ];
   then
 #below message + means add/append to the previos message. 
   message+="HIGH DISK USAGE ON $partition: $usage \n"
   fi
 done <<< $DISK_USAGE
 echo "messge : $message" 

#  echo "$message High Disk Usage" | mail -s "message" sudheerkonda9@gmail.com

#How to call other shell script from your current shellscript file
sh mail.sh sudheerkonda9@gmail.com "HIGH DISK USAGE" "$message" "DEVOPSTEAM" "High Disk Usage"