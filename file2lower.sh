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

doWord "$1" "$2"
# remove doubles
cat "$2" |sort -u
