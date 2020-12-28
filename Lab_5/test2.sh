#!/bin/bash

# Delay between measurements
delay=1000
./mem.bash &
./mem2.bash &
echo Starting spy with delay $delay > report_spy2.txt
while pgrep 'mem[2]*.bash' > /dev/null 
do
	top -b -n 1 | head -n 12 | tail -n 9 >> report_spy2.txt
	echo -------------------------------------------------------------------- >> report_spy2.txt
done
echo 'Finished, kill report:' >> report_spy2.txt
dmesg | grep 'mem[2]*.bash' | tail -n 4 >> report_spy2.txt