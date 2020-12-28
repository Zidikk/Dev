#!/bin/bash

sh 4_aux.sh & proc1=$!
sh 4_aux.sh & proc2=$!
sh 4_aux.sh & proc3=$!
top n 1 | grep 4_aux.sh
renice 10 -p $pid1
at now + 1min <<< "kill $proc3"
at now + 1min <<< "top -n 1 | grep 4_aux.sh"
at now + 2min <<< "kill $proc1;kill $proc2"        