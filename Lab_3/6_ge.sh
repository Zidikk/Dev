#!/bin/bash

while true
do
	read LINE
	case "$line" in
		"TERM")
			kill -SIGTERM $(cat pid)
			exit 0
		;;
		"+")
			kill -USR1 $1 $(cat pid)
		;;
		"*")
			kill -USR2 $1 $(cat pid)
		;;
		*)
			:
		;;
	esac
done