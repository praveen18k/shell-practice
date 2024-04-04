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
LOGDIR=/home/centos/shell-logs
SCRIPT_NAME=$0
LOGFILE=$LOGDIR/$SCRIPT_NAME-$DATE.log
Userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Validations() {
    if [ $1 -ne 0 ]
    then 
        echo -e "Installing $2...$R failure $N"
        exit 1
    else
        echo -e "Installing $2...$G success $N"
    fi
}

if [ $Userid -ne 0 ]
then
    echo -e "$Y Error:: run this with root access $N"
    exit 1
fi

for i in $@
do
    yum list install $i -y &>>$LOGFILE
    if [ $? -ne 0 ]
    then
        echo " $i is not istalled, lets install"
        yum install $i -y &>>$LOGFILE    
        Validations $? "$i"
    else
        echo "$Y $i already installed $N"
    fi
done

