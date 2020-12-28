#!/bin/bash

today="$(date +%F)"
backup="$(ls -d /home/user/*/ | grep Backup | sort -r | head -n 1)"
if  [ ! -e $backup ]
	then echo "No backups found in /home/user"
	exit 0
fi
echo "Latest backup found"
echo -e "Restoring from $backup...\n"
for file in "$backup"*
do
	#echo Checking $file
	if [[ $file =~ .*\.[0-9]{4}-[0-9]{2}-[0-9]{2} ]]
		then continue
	fi
	cp --update $file /home/user/restore
	echo Copying $file
done
echo -e "\nRestored from $backup"