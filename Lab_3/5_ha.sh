#!/bin/bash

var=1
currOp="+"
re='[0-9]+'
(tail -f circus) |
while true 
do
    read LINE
    case $LINE in
	    "QUIT")
		    killall tail
		    echo "scheduled stop and exit"
		    exit 0
		;;
	    "+")
		    currOp="$LINE"
		;;
	    "*")
		    currOp="$LINE"
		;;
	    *)	
		    if [[ "$LINE" =~ $reg ]]
		        then if [[ "$currOp"=="+" ]]
			        then var=$(( $var + $LINE ))
			    fi
            fi
			if [[ "$currOp"=="*" ]]
			    then var=$(( $var * $LINE ))
			echo $var
		    else	
			    killall tail
			    echo "ER: input data error"
			    exit -1
		    fi
		    ;;
    esac
done