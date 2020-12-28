function Interactive 
{
    if [ $# -lt 1 ]
        then echo -e "ER: parameters missing\nYou must have at least 1" >&2
        exit -1
    fi 

    case $1 in
        "q" )
            echo -e "Enter sum/sub/mul/div:"
            read a
            echo -e "Enter number:"
            read b
            echo -e "Enter number:"
            read c
            if [ ! -e "calc.sh" ] 
                then echo -e "ER: can't find calc.sh" >&2
                exit -1
            elif [ ! -r "calc.sh" ] 
                then echo -e "ER: can't use calc.sh" >&2
                exit -1
            else
                . ./calc.sh
                calculator $a $b $c
            fi
        ;;
        "w" )
            echo -e "Enter the required condition or nothing:"
            read a
            if [ ! -e "help.sh" ] 
                then echo -e "ER: can't find help.sh" >&2
                exit -1
            elif [ ! -r "help.sh" ] 
                then echo -e "ER: can't use help.sh" >&2
                exit -1
            else
                . ./help.sh
                help $a
            fi   
        ;;
        "e" )
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
        "r" )
            echo -e "Enter directory:"
            read a
            echo -e "Enter expression:"
            read b
            if [ ! -e "search.sh" ] 
                then echo -e "ER: can't find search.sh" >&2
                exit -1
            elif [ ! -r "search.sh" ] 
                then echo -e "ER: can't use search.sh" >&2
                exit -1
            else
                . ./search.sh
                search $a $b
            fi    
        ;;
        "t" )
            echo -e "Enter infile:"
            read a
            echo -e "Enter outfile:"
            read b
            if [! -e "reverse.sh" ] 
                then echo -e "ER: can't find reverse.sh" >&2
                exit -1
            elif [ ! -r "reverse.sh" ]
                then echo -e "ER: can't use reverse.sh" >&2
                exit -1
            else
                . ./reverse.sh
                reverse $a $b
            fi
        ;;
        "y" )
            echo -e "Enter string:"
            read a
            echo $a | awk '{print length}'
        ;;
        "u" )
            echo -e "Enter number or nothing:"
            read a
            if [ -n $a ] 
                then if (echo "$a" | grep -E -q "^-?[0-9]+$") 
                    then if [ $a -gt 255 ] || [ $a -lt 0 ] 
                        then echo "ER: exit number must be in the range 0...255" >&2
                        exit -1
                    fi
                    exit $num
                else
                    echo "ER: not number" >&2
                    exit -1
                fi
            else
                exit 0    
            fi
        ;;
        * )
            echo "ER: parameters missing" >&2
            exit -1
        ;;
    esac
}

function UI 
{
    while true 
    do
        echo -e "Enter the amand:
    [q]: calculator
    [w]: help
    [e]: log
    [r]: search
    [t]: reverse
    [y]: strlen
    [u]: exit
    "
        read a
        Interactive $a
    done
}