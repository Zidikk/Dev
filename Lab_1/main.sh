#!/bin/bash

if [ $# -lt 1 ] 
    then echo -e "ER: parameters missing\nYou must have at least 1" >&2
    exit -1
fi
case $1 in
    "calc" )
        if [ $# -gt 3 ] 
            then if [ ! -e "calc.sh" ]
                then echo -e "ER: can't find calc.sh" >&2
                exit -1
            elif [ ! -r "calc.sh" ]
                then echo -e "ER: can't use calc.sh" >&2
                exit -1
            else
                . ./calc.sh
                calculator $2 $3 $4
        fi
        else
            echo -e "ER: parameters missing for calculator\nYou must have at least 4 parameters: calc sum/sub/mul/div number number" >&2
            exit -1
        fi
    ;;
    "strlen" )
        if [ $# -gt 1 ]
            then echo $2 | awk '{print length}'
        else
            echo -e "ER: parameters missing for strlen\nYou must have at least 2 parameters: strlen string" >&2
        fi
    ;;
    "help" )
        if [ ! -e "help.sh" ]
            then echo -e "ER: can't find help.sh" >&2
            exit -1
        elif [ ! -r "help.sh" ]
            then echo -e "ER: can't use help.sh" >&2
            exit -1
        else
            . ./help.sh
            help $2
        fi
    ;;
    "interactive" )
        if [ ! -e "interactive.sh" ] 
            then echo -e "ER: can't find interactive.sh" >&2
            exit -1
        elif [ ! -r "interactive.sh" ]
            then echo -e "ER: can't use interactive.sh" >&2
            exit -1
        else
            . ./interactive.sh
            UI
        fi
    ;;
    "log" )
        if [ ! -e "log.sh" ]
            then echo -e "ER: can't find log.sh" >&2
            exit -1
        elif [ ! -r "log.sh" ]
            then echo -e "ER: can't use log.sh" >&2
            exit -1
        else
            . ./log.sh
            log
        fi
    ;;
    "reverse" )
        if [ $# -gt 2 ]
            then if [ ! -e "reverse.sh" ]
                then echo -e "ER: can't find reverse.sh" >&2
                exit -1
            elif [ ! -r "reverse.sh" ]
                then echo -e "ER: can't use reverse.sh" >&2
                exit -1
            else
                . ./reverse.sh
                reverse $2 $3
            fi
        else
            echo -e "ER: parameters missing for reverse\nYou must have at least 3 parameters: search infile outfile" >&2
            exit -1
        fi
    ;;
    "search" )
        if [ $# -gt 2 ]
            then if [ ! -e "search.sh" ] 
                then echo -e "ER: can't find search.sh" >&2
                exit -1
            elif ! [[ -r "search.sh" ]]
                then echo -e "ER: can't use search.sh" >&2
                exit -1
            else
                . ./search.sh
                search $2 $3
            fi
        else
            echo -e "ER: parameters missing for search\nYou must have at least 3 parameters: search directory expression" >&2
            exit -1
        fi
    ;;
    "exit" )
        if [ $# -gt 1 ]
            then if (echo "$2" | grep -E -q "^-?[0-9]+$")
                then if [ $2 -gt 255 ] || [ $2 -lt 0 ]
                    then echo "ER: exit number must be in the range 0...255" >&2
                    exit -1
                fi
                exit $2
                else
                    echo "ER: not number" >&2
                    exit -1
            fi
            else
                exit 0
        fi
    ;;
    * )
        echo "ER: parametrs missing" >&2
        exit -1
    ;;
esac