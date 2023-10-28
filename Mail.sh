#!/bin/bash

#Any one in your project can call this script with arguements

TO_Address=$1
SUBJECT=$2
BODY=$3
TEAM_NAME=$4
ALERT_TYPE=$5

echo "all args: $@"

echo "$BODY" | mail -s "$SUBJECT" $TO_Address

# Body you need to prepare it , we have a template here , we need to put the values inside "template.html" file to do this we need to understand the sed editor
