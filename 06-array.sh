#!/bin/bash

#this is array, insted of single value it can hold multiple values.

Persons=("Praveen" "Naveen" "Shekar")

#inside array we always refer values with index and it starts from 0

echo "First Person: ${Persons[0]}"

#if you want all persons names 

echo "All Persons names: ${Persons[@]}