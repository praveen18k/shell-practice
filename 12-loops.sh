#!/bin/bash

#improvements
#implement log files
#implement colors
#implement validations
#implement validations through functions
#Check for root user acceess
#your script should check package is already installed or not, if already installed print yellow color
#if installed just print package is already installed, it should not run install command

#all args are in $@

DATE=$(Date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/shell-logs/$SCRIPT_NAME-$DATE.log
Userid=$(id -u)

Validations() {

    if [ $1 -ne 0 ]
    then 
        echo "$2...Installation failure"
        exit 1
    else
        echo "$2...Installation success"
    fi
}

if [ $Userid -ne 0 ]
then
    echo "Error:: run this with root access"
    exit 1
fi

for i in $@
do
    yum install $i -y

done

