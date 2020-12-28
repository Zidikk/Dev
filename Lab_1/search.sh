function search 
{
    if [ ! -d $1 ] 
      then echo -e "ER: not a directory" >&2
      exit -1
    fi
    if [ ! -r $1 ] 
      then echo -e "ER: you haven't access" >&2
      exit -1
    fi
    grep -r "$2" "$1" 2> /dev/null
}