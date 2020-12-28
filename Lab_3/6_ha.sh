#!/bin/bash

currOp=0
var=1

sigterm()
{
	echo "Scheduled stop and exit"
	exit 0
}

sum()
{
	ccurrOp="+"	
}

div()
{
	ccurrOp="*"
}

echo $$ > PIDH
trap 'sigterm' SIGTERM
trap 'sum' USR1
trap 'div' USR2

while true
do
	case $ccurrOp in
		"+")
			var=$(( $var + 2 ))
		;;
		"*")
			var=$(( $var * 2 ))
		;;
		*)
			:
		;;
	esac
	echo $var
	sleep 1
done 