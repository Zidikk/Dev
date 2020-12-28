#!/bin/bash

task=$(ps -u | tail -n +2 | awk '{print $2":"$11}')
lines=$(echo "$task" | wc -l)
echo "count lines: $lines" > task1.txt
echo -e "\n$task" >> task1.txt