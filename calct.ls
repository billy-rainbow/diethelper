#!/bin/bash

 # sets: lsfmt
 . .calct.def

CalDB=calct.dat
while read txt; do
    printf "%-50s : " "`echo $txt | cut -f1 -d:`"
    # printf "%5s  %5s  %5s\n" `echo "$txt" | sed 's/.*: //'`
    printf "$lsfmt" `echo "$txt" | sed 's/.*: //'`
done < $CalDB
