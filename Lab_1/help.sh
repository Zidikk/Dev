function help 
{
    case $1 in
        "calc" )
            echo -e "For calculator, you must select 1 of 4 parameters: calc sum/sub/mul/div number number\nCalculats for 2 numbers"
        ;;
        "strlen" )
            echo -e "For strlen you must have at least 2 parameters: strlen string\nPrint the lengh of string"
        ;;
        "exit" )
            echo -e "For exit you must have at least 1 parameters: exit\nIn this case number of exit will 0\nIf you use exit number, number of exit will be your number."
        ;;
        "interactive" )
            echo -e "For interactive you must have at least 1 parameters: interactive\nEnter to interactive mode"
        ;;
        "log" )
            echo -e "For log you must have at least 1 parameters: log\nThat print on screen logs from X.log"
        ;;
        "reverse" )
            echo -e "For reverse must have at least 3 parameters: reverse infile outfile\nReverse infile and put it to outfile"
        ;;
        "search" )
            echo -e "For search you must have at least 3 parameters: search directory expression\nSearch in this directory files which is approached expression"
        ;;
        * )
            echo -e "You can use this commands:\n interactive calc search reverse strlen log exit\nFor additional information you can write: help command"
        ;;
    esac
}