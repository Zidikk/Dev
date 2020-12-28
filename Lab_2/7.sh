#!/bin/bash

for LINE in $(ps -a -u root -o pid,command | awk '{print $1 "," $2}')
do
    pid=`echo $LINE | cut -d "," -f 1`
    command=`echo $LINE | cut -d "," -f 2`
    mem=`grep -s "read_bytes" "/proc/$pid/io" | cut -d ":" -f 2`
    if [ -n $mem ]
        then echo $pid $command $mem
    fi
done > text7.txt
sleep 1m
for LINE in $(ps -a -u root -o nPid,command | awk '{print $1 "," $2}')
do
    nPid=$(awk '{print $1}' <<< $line)
    nCommand=$(awk '{print $3}' <<< $line)
    nMem=`grep -s "read_bytes" "/proc/$nPid/io" | cut -d ":" -f 2`
    lMem=`grep $nPid buffer.txt | awk '{print $3}'`
    if [ -n $nMem && -n $lMem ]
        then ans=$(($nMem - $lMem))
        echo "nPid: $nPid Command: $nCommand Memory: $ans"
    fi
done | sort -n -t ':' -k 3 | head -3 > text7.txt
rm buffer.txt