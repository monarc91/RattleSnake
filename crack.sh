#!/bin/bash

doWord(){
    file="$1"

    while IFS= read -r line
    do
        length=${#line}
        majInit=`echo ${line:0:1} |tr '[:lower:]' '[:upper:]'`
        maj=`echo ${line} |tr '[:lower:]' '[:upper:]'`

        echo "$line"
        echo "$majInit${line:1:length}" # MAJ-word
        echo "$maj"

        for k in {1..99}
        do
            echo "$majInit${line:1:length}$k" # MAJ-word-number
            echo "$k$majInit${line:1:length}" # number-MAJ-word
            echo "$line$k"
            echo "$k$line"
            echo "$maj$k"
            echo "$k$maj"
        done
    done < "$file"
}

doWord "$1"
