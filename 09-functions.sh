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
#If you add colors for Success and Failure output messages it looks good.
#syntax for colors 
#\e[31m --> Red
#\e\[32m -->Green
#\e\[0m --> Normal color

#Function syntax:
#FUNCTION_NAME() {
    #here you write your statements,and call this function whenever required.
#}

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

#this funtion should validate the previous command and inform to user it is success or failure
VALIDATE(){
if [ $1 -ne 0 ]
then 
    echo -e "$2...$R Failure $N"
    exit 1
else
    echo -e "$2...$G Success $N"
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