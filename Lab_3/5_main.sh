#!/bin/bash

mkfifo circus
sh 5_ha.sh & sh 5_ge.sh
rm circus