#!/bin/bash

#**Functions**: You will keep some code inside functions which is more often repeated, and call whenever you required.
#**Functions**: Will do some work behalf of us and it will update what happend.
#Note - log files are important to know what happend, so we use below redirections:
#Redirections success and failure no's
#1 --> sucess
#2 --> failure
#& --> both sucess and failure 
#&>> --> to redirect the success or failure output(log files)
#Date and time stamps are important when we are executing scripts.

#Function syntax:
#FUNCTION_NAME() {
    #here you write your statements,and call this function whenever required.
#}

DATE=$(date +%f)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

#this funtion should validate the previous command and inform to user it is success or failure
VALIDATE(){
if [ $1 -ne 0 ]
then 
    echo "$2...Failure"
    exit 1
else
    echo "$2...Success"
fi
}

Userid=$(id -u) 
if [ $Userid -ne 0 ]
then 
    echo "Error:: please run this with sudo access"
    exit 1 
#else
   # echo "Info:: You are root user"
fi 

#it is our responsibility again to check installation is success or not

yum install git -y &>>$LOGFILE

VALIDATE $? "Installing git"

yum install postfix -y &>>$LOGFILE

VALIDATE $? "Installing postfix"