#!/bin/bash

APP_LOGS=/home/centos/app-logs
DATE=(date +%F:%H:%M:%S)
LOGDIR=/home/centos/shell-logs
SCRIPT_NAME=$0
# /home/centos/shell-logs/script name-date.log
LOGFILE=$LOGDIR/$$SCRIPT_NAME-$$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS -name ".log" -type f -mtime +14)

echo " Script started executing at $DATE" &>>$LOGFILE

While read line
do
    echo "Deliting $line" &>>$LOGFILE
    rm -rf $line
done <<< $FILES_TO_DELETE

