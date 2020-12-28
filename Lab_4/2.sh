#!/bin/bash

if [ ! -n "$1" ]
then echo "WARNING: parameters missing"
fi
IFS=$'\n'
for file in $(cat ~/.trash.log | awk "\$1 ~ $1 {print \$0}") 
do
	source=~/.trash/"$(echo $file | awk '{print $2}')"
	dest="$(echo $file | awk '{print $1}')"
	echo "This file? [y/n] | $dest"
	read ANS
	if [[ $ANS == y ]] 
		then if [ -e "$(dirname $dest)" ] 
			then ln $source $dest && rm $source && echo "File $dest untrashed successfully"
		else ln $source ~/$1 && rm $source && echo "Target directory not found, untrashing to user home" 
		fi
			exit 0
	fi
done
echo "Nothing was untrashed"