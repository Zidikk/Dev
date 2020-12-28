#!/bin/bash

ps -Ao pid,command | tail -n +2 | grep -E "[0-9]+ /sbin/" > task2.txt