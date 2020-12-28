#!/bin/bash

mSize=0
mPid=0
for pid in $(ps -a -u root o pid)
do
    size=`grep -s "VmPid" "/proc/"$pid"/status" | awk '{print $2}'`
    if [[ $size > $mSize ]]
        then mSize=$size
        mPid=$pid
    fi
done
top -p $mPid -b -n 1 > buffer.txt
vm=`cat buffer.txt | grep $mPid | awk '{print $5 }'`
echo "$mPid : $mSize : $vm" > text6.txt
rm buffer.txt