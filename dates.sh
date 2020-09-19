#!/bin/bash


longueurMaxDate=$1
possibilities=0

declare -a dates1
declare -a dates



dat() 
{
    indexA=0
    for y in {1945..2020}
    do
        if [ "$1" -eq 4 ]
        then
            dates1["$indexA"]="$y"
            indexA=$(($indexA+1))
        fi
        for m in {01..12}
        do
            if [ "$1" -eq 4 ]
                then
                    lgd=1
                    dates1["$indexA"]="$m${y:2}"
                    indexA=$(($indexA+1))
                    possibilities=$(($possibilities+1)) 
            fi
            for d in {01..31}
            do
                if [ "$1" -eq 4 ]
                then
                    lgd=1
                    if [[ $m < 10 && $d < 10 ]]
                    then
                        dates1["$indexA"]="${d:$lgd}${m:$lgd}${y:2}"
                        possibilities=$(($possibilities+2))
                        indexA=$(($indexA+1))
                    fi
                    dates1["$indexA"]="$d$m"
                    indexA=$(($indexA+1))
                fi
                #echo "$d$m${y:2}"
            done
        done
    done
    echo "done"
    echo "${dates1[@]}" | tr ' ' '\n' | sort -u > temp.sn

    
    file="temp.sn"
    poss=0
    j=0
        while IFS= read -r line
        do
            dates["$j"]="${line}"
            # echo "$line placé dans dates[]"
            poss=$(($poss+1))
            j=$(($j+1))
        done < "$file"

    rm temp.sn
    echo -e "Removed temp file and array ready!"
    echo -e "---------------------------------\n"
}

unset dates1
dat $1
# for h in ${dates[@]}
#     do
#         echo $h
#     done
echo "Enfin finit nombre de possibilités en 4 chiffres: $possibilities"
echo "possibilités une fois triées: $poss"
order=$4
case=$3
dict=$2
echo " $dict est le dico $case est la casse et $order est l'ordre,  hello monarc!"

doWord(){
    file="$1"
    [ ${2} ] && cas=$2 || cas=4
    [ ${3} ] && ord=$3 || ord="all"
    echo $ord
    while IFS= read -r line
    do
        length=${#line}
        majInit=`echo ${line:0:1} |tr '[:lower:]' '[:upper:]'`
        maj=`echo ${line} |tr '[:lower:]' '[:upper:]'`
        if  [ $cas -eq 1 ] 
        then
          echo "$line"
        fi
        if  [ $cas -eq 2 ] 
        then
          echo "$majInit${line:1:length}" # MAJ-word
        fi
        if  [ $cas -eq 3 ] 
        then
          echo "${maj}"
        fi
        if  [ $cas -eq 4 ] 
        then
          echo "$line"
          echo "$majInit${line:1:length}" # MAJ-word
          echo "${maj}"
        fi
        for k in ${dates[@]}
        do
        if [[ $cas -eq 1 && $ord == "all" ]]
        then
            echo "${line}${k}"
            echo "${k}${line}"
          
        fi
        if [[ $cas -eq 1 && $ord == "normal" ]]
        then
            echo "${line}${k}"
        fi
        if [[ $cas -eq 1 && $ord == "reverse" ]]
        then
            echo "${k}${line}"
        fi
        if  [[ $cas -eq 2 && $ord == "all" ]]
        then
            echo "${majInit}${line:1:length}${k}" # MAJ-word-number
            echo "${k}${majInit}${line:1:length}" # number-MAJ-word
        fi
        if  [[ $cas -eq 2 && $ord == "normal" ]] 
        then
            echo "${majInit}${line:1:length}${k}" # MAJ-word-number
        fi
        if  [[ $cas -eq 2 && $ord == "reverse" ]]
        then
            echo "${k}${majInit}${line:1:length}" # number-MAJ-word
        fi
        if  [[ $cas -eq 3 && $ord == "all" ]] 
        then
            echo "${maj}"
            echo "${maj}${k}"
            echo "${k}${maj}"
        fi
        if  [[ $cas -eq 3 && $ord == "normal" ]] 
        then
            echo "${maj}${k}"
        fi
        if  [[ $cas -eq 3 && $ord == "reverse" ]] 
        then
            echo "${k}${maj}"
        fi
        if  [[ $cas -eq 4 && $ord == "all" ]] 
        then
            echo "${maj}${k}"
            echo "${k}${maj}"
            echo "${majInit}${line:1:length}${k}" # MAJ-word-number
            echo "${k}${majInit}${line:1:length}" # number-MAJ-word
            echo "${line}${k}"
            echo "${k}${line}"
        fi
        if  [[ $cas -eq 4 && $ord == "normal" ]] 
        then
            echo "${maj}${k}"
            echo "${majInit}${line:1:length}${k}" # MAJ-word-number
            echo "${line}${k}"
        fi
        if  [[ $cas -eq 4 && $ord == "reverse" ]] 
        then
            echo "${k}${maj}"
            echo "${k}${majInit}${line:1:length}" # number-MAJ-word
            echo "${k}${line}"
        fi
        
      done
    done < "$file" 
}

doWord "$dict" "$case" "$order"

exit 0

# bossé en deux heures
