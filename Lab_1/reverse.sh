function reverse 
{
    if [ ! -e $1 ]
      then echo -e $1 "ER: not a file" >&2
      exit -1
    fi
    if [ ! -r $1 ]]
      then echo -e "ER: you haven't access to infile" >&2
      exit -1
    fi
    if [ -f $2 ] && [ ! -w $2 ]
      then echo -e "ER: you haven't access to outfile" >&2
      exit -1
    fi
    if ! ( >> $2) 2>/dev/null 
      then echo -e "ER: you haven't access to directory" >&2
      exit -1
    fi
    if [ -d $2 ] 
      then echo -e "ER: out is not a file" >&2
      exit -1
    fi
    tac $1 | rev > $2
}