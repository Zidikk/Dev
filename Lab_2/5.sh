#!/bin/bash

sum=0
counter=0
aPPid=-13
while read LINE
do
    runtime=`echo $LINE | cut -d ":" -f 3 | cut -d "=" -f 2`
    PPid=`echo $LINE | cut -d ":" -f 2 | cut -d "=" -f 2`
    if [[ $aPPid = -13 ]]
        then echo $LINE
        aPPid=$PPid
        sum=$runtime
        counter=1
    fi
    if [ $PPid = $aPPid ]
        then echo $LINE
        sum=`bc <<< " $runtime + $sum"`
        count=$(( count + 1 ))
    else
        echo "Average_Sleeping_children_of_ParentID=$aPPid is" `bc <<< "$sum / $count"`
        echo $LINE
        aPPid=$PPid
        sum=$runtime
        counter=1
    fi
done < task4.txt > task5.txt