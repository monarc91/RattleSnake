#!/bin/bash

doWord(){
    file="$1"
    
    while IFS= read -r line
    do
        length=${#line}
        min=`echo ${line} |tr '[:upper:]' '[:lower:]'`

        echo "${min}" >> "$2"

    done < "$file" 
} 
# remove doubles
cat "$1" |sort -u > temp.txt
# get to lower case
doWord "temp.txt" "$2"
rm temp.txt
exit 0

