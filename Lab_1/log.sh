function log 
{
  while read LINE
  do 
    if [[ "$LINE" = *"(WW)"* && "$LINE" != *"(WW) warning, (EE) error, (NI) not implemented, (??) unknown."* ]]
      then echo -e "${LINE//"(WW)"/"\033[93mWarning:\033[0m"}"
    fi
  done < "/home/zidik/var/log/anaconda/X.log"
  while read LINE 
  do 
    if [[ "$LINE" = *"(II)"* && "$LINE" != *"(++) from command line, (!!) notice, (II) informational,"* ]]
      then echo -e "${LINE//"(II)"/"\033[94mInformation:\033[0m"}"
    fi
  done < "/home/zidik/var/log/anaconda/X.log"
}