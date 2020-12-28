function calculator 
{
    if ! (echo "$2" | grep -E -q "^-?[0-9]+$")
        then echo $2 "ER: not number" >&2
        exit -1
    fi 
    if ! (echo "$3" | grep -E -q "^-?[0-9]+$")
        then echo $3 "ER: not number" >&2
        exit -1
    fi
    case $1 in
        "sum" )
            echo $(($2 + $3))
        ;;
        "sub" )
            echo $(($2 - $3))
        ;;
        "mul" )
            echo $(($2 * $3))
        ;;
        "div" )
            if [[ $3 = '-0' ]] || [[ $3 = '+0' ]] || [[ $3 = '0' ]]
            then  
                echo "ER: division by zero" >&2
                exit -1
            fi
            echo $(($2 / $3))
        ;;
        * )
            echo -e "No such command for calculator\nUse sum/sub/mul/div" >&2
        ;;
    esac
}