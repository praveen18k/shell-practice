#!/bin/bash

#another type of variables 
#If we want to connect to DB, We need password so betterto use promt to enter password
#Read command --> it takes the input from the terminal

 echo " Please enter your username"

 read -s USERNAME #this is the variable where the value of the one user entered

 echo " Username entered is: $USERNAME"

 echo "Please enteryour password"

 read -s PASSWORD 

 echo " Password entered is:$PASSWORD"
 