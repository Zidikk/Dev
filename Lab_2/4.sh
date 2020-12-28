#!/bin/bash

for pid in $(ps -Ao pid | tail -n +2)
do
  tmp="/proc/"$pid
  if [ -e $tmp"/status" ] && [ -e $tmp"/sched" ]
    then ppid=$(grep "PPid:*" $tmp"/status" | grep -oE "[0-9]+")
    if [ -z $ppid ]
      then ppid=0
    fi
    swtc=$(grep -s "nr_switch" /proc/$pid/sched | awk '{print $3}')
    realTime=$(grep -s "sum_exec_runtime" /proc/$pid/sched | awk '{print $3}')
    if [ -z $realTime ] || [ -z $swtc ] || [[ $swtc = "0" ]]
    then art=0
    else
      art=$(echo "$realTime/$swtc" | bc | awk '{printf "%f", $0}')
    fi
    echo "$pid $ppid $art"
  fi
done | sort -nk2 | awk '{print "ProcessID="$1" : Parent_ProcessID="$2" : art="$3}' >task4.txt