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

Userid=$(id -u) 
if [ $Userid -ne 0 ]
then 
    echo "Error:: please run this with sudo access"
    exit 1 
#else
   # echo "Info:: You are root user"
fi 

#it is our responsibility again to check installation is success or not
yum install git -y

if [ $? -ne 0 ]
then 
    echo "Installation of git is error"
    exit 1
else
    echo "Installation os git is success"
fi

yum install postfix -y

if [ $? -ne 0 ]
then 
    echo "Installation of postfix is error"
    exit 1
else
    echo "Installation os postfix is success"
fi