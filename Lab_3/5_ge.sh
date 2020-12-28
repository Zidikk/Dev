#!/bin/bash

reg='[0-9]+'
while true
do
	read LINE
	echo $LINE > circus
	if [ "$LINE" == "QUIT" ]; 
		then exit 0
	fi
	if ! [ "$LINE" =~ $reg ]
		then if [ "$LINE" != "+" && "$LINE" != "*" ]
			then echo "ER: input data error"
			exit -1
		fi
	fi
done