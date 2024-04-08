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

if [ $Userid -ne 0 ]
then
    echo -e "$Y Error:: run this with root access $N"
    exit 1
fi

Validations() {
    if [ $1 -ne 0 ]
    then 
        echo -e "Installing $2...$R failure $N"
        exit 1
    else
        echo -e "Installing $2...$G success $N"
    fi
}

for i in $@
do
    yum list installed $i -y &>>$LOGFILE
    if [ $? -ne 0 ]
    then
        echo " $i is not istalled, lets install"
        yum install $i -y &>>$LOGFILE    
        Validations $? "$i"
    else
        echo "$Y $i already installed $N"
    fi
done

    #let's break down the shell script step by step:
    #The script starts with a shebang (#!/bin/bash) indicating that it's a bash script.
    #Comments are provided at the beginning of the script to describe the improvements that can be made, such as implementing log files, colors, and validations.

    #Some variables are initialized:
    #    DATE: Stores the current date in the format %F (YYYY-MM-DD).
    #    LOGDIR: Specifies the directory where log files will be stored.
    #    SCRIPT_NAME: Stores the name of the script.
    #    LOGFILE: Specifies the path for the log file using the script name and date.
    #    Userid: Stores the user ID of the current user running the script using id -u.

    #Colors are defined using ANSI escape codes:
    #    R: Red
    #    G: Green
    #    Y: Yellow
    #    N: No color (reset)

    #A function named Validations is defined. It takes two arguments:
    #    $1: The return code of the command.
    #    $2: The name of the package being installed.
    #If the return code is non-zero, it indicates a failure, and it prints a failure message. Otherwise, it prints a success message.

    #It checks if the script is being run with root privileges ($Userid -ne 0). If not, it prints an error message and exits.

    #The script iterates over each argument passed to it ($@). For each argument:
    #    It checks if the package is already installed using yum list installed $i -y &>>$LOGFILE.
    #    If the package is not installed (return code $? -ne 0), it installs it using yum install $i -y &>>$LOGFILE and calls the Validations function to check if the installation was successful.
    #    If the package is already installed, it prints a message indicating so.

    #That's the overall flow of the shell script. It aims to install packages passed as arguments, logging the process and providing feedback about the installation status.

