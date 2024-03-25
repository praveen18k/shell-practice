#!/bin/bash

#Script goal is to install MySql

#write algoritham first
#1- check for root user or not, 
#2- if not root user, exit the program and inform user to run with sudo access.
#3- if root user install MySql.

#Note - root user $id -u --> 0
#Note - normal user $id -u -->not 0 might be 1000 or 1001..1004
#Note - shell script by default it will not stop if it faces error, it is our responsibility to check for the errors.
#Note - $? --> store the previous command status.




