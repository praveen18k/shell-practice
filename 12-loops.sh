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

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/shell-logs/$SCRIPT_NAME-$DATE.log
Userid=$(id -u)

R="\e[32m"
G="\e[31m"
N="\e[0m"

Validations() {
    if [ $1 -ne 0 ]
    then 
        echo "$2...$R failure $N"
        exit 1
    else
        echo "$2...$G success $N"
    fi
}

if [ $Userid -ne 0 ]
then
    echo "$R Error:: run this with root access"
    exit 1
fi

for i in $@
do
    yum install $i -y &>>$LOGFILE

    Validations $? " Installing git"

done

