#!/bin/bash

let n=3240000
k=30
for i in $(seq 0 $k)
do
	./newmem.bash $n &
done
# Start the spy
./test.sh