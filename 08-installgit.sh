#!/bin/bash

#Note - root user $id -u --> 0
#Note - normal user $id -u -->not 0 might be 1000 or 1001..1004
#Note - shell script by default it will not stop if it faces error, it is our responsibility to check for the errors.
#Note - $? --> store the previous command status.
#Note - $? --> 0 then previous command is success. (ex: echo $? = 0)
#Note - $? --> not 0 then previous command is failuer. (ex: echo $? = 127 : exit status 1 to 127 anything is failuer)
#Note - less lines of code, more work. reduce the no of lines of code. use functions.
#Q)This is the imp interview @ what is exit status ?
#A- By default shell script cannot understand the previous command is success or failure, it is our responsibility to check that is through the Exit status, if exit status is 0 we can consider it as sucess if exit status is 1 to 127 we can consider it as failure.

#**Functions**: You will keep some code inside functions which is more often repeated, and call whenever you required.

#Script goal is to install MySql

#write algoritham first
#1- check for root user or not, 
#2- if not root user, exit the program and inform user to run with sudo access.
#3- if root user install MySql.

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






