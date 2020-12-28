#!/bin/bash

# Delay between measurements
delay=10s
#./mem.bash &
echo Starting spy with delay $delay > report_spy.txt
while pgrep 'mem.bash' > /dev/null 
do
	top -b -n 1 | head -n 12 | tail -n 9 >> report_spy.txt
	echo -------------------------------------------------------------------- >> report_spy.txt
	sleep $delay
done
echo 'Finished, kill report:' >> report_spy.txt
dmesg | grep mem.bash | tail -n 2 >> report_spy.txt