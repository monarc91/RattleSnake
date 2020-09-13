#!/bin/bash

doWord(){
    file="$1"

    while IFS= read -r line
    do
        echo "$line"
        for k in {1..99}
        do
            echo "$line$k"
            echo "$k$line"
        done
    done < "$file"
}

doWord "$1"
