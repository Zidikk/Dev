#!/bin/bash

counter=0
declare -a array
echo "" > report2.log
while true
do
	array+=(1 2 3 4 5 6 7 8 9 10)
	let counter=$counter+1
	let hello=$counter%1000000
	if [ $hello -eq 0 ] 
		then echo "${#array[*]}" >> report2.log
	fi
done