#!/bin/bash

nTime=$(date +"%D_%T")
mkdir ~/test && echo "catalog test was created successfully" > ~/report && touch ~/test/$nTime
ping www.net_nikigo.ru || echo "$nTime Error: no connection to the site" >> ~/report