#!/bin/bash

today="$(date +%F)"
dir_name=/home/user/Backup-$today
created=true
log=/home/user/backup-report
for i in 0 1 2 3 4 5 6 7
do
	backup=/home/user/Backup-$(date +%F --date="$i days ago")
	echo "Checking $backup"
	if [ -e "$backup" ] 
		then dir_name=$backup
		created=false 
		echo "$backup exists"
		break 
	fi
done
if [[ ! $created == true ]]
	then mkdir $dir_name && echo "[$today] Created new backup catalog $dir name" >> $log 
fi
for file in "$(ls /home/user/source)"
do
	full=/home/user/source/$file
	backup=$dir_name/$file
	if ! [ -e $backup ] || [[ "$(wc --bytes $full)" != "$(wc --bytes $backup)" ]]
		then if [ -e $backup ] 
			then echo "[$today] Updated $backup --> $backup.$today" >> $log
		else echo "[$today] Added $backup" >> $log
		fi
		cp $full $dir_name --backup --suffix=.$today
	fi
done