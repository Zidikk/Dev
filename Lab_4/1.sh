#!/bin/bash

if [ ! -n "$1" ]
    then echo "WARNING: parameters missing"
fi
if [ ! -e ~/.trash ]
    then mkdir ~/.trash
fi
if [ ! -e ~/.trash/.counter ]
    then echo 0 > ~/.trash/.counter
fi
let new_name="$(cat ~/.trash/.counter)"+1
echo $new_name > ~/.trash/.counter
ln $1 ~/.trash/$new_name && rm $1 && echo "$(realpath $1) $new_name" >> ~/.trash.log