#!/bin/bash
    #--------------------------------------------------------------------------#
    #                __    __  .__                               __            #
    # ____ _______ _/  |__/  |_|  |   ____   ______ ____ _____  |  | __ ____   #
    # \_  __ \__  \\   __\   __\  | _/ __ \ /  ___//    \\__  \ |  |/ // __ \  #
    #  |  | \// __ \|  |  |  | |  |_\  ___/ \___ \|   |  \/ __ \|    <\  ___/  #
    #  |__|  (______/__|  |__| |____/\_____>______>___|__(______/__|_ \\_____> #
    #                                                                          #
    #                                                                          #
    #==========================================================================#
    #   dateUS.sh is part of RattleSnake (rtlsnake.sh RattleSnake)             #
    #   RattleSnake to accommodate dictionnary                                 #
    #   Author: Monarc(Marc Segur)                                             #
    #   Contact: pc-mac@mail.com                                               # 
    #   Date: 15 september 2020                                                #
    #   Version: 0.9.2                                                         #
    #   Licence:  GPL3                                                         #
    #   Copyright: Monarc(c)2020                                               #
    #__________________________________________________________________________#
    
    # This file is part of RattleSnake.

    # RattleSnake is free software: you can redistribute it and/or modify
    # it under the terms of the GNU General Public License as published by
    # the Free Software Foundation, either version 3 of the License, or
    # (at your option) any later version.

    # Foobar is distributed in the hope that it will be useful,
    # but WITHOUT ANY WARRANTY; without even the implied warranty of
    # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    # GNU General Public License for more details.

    # You should have received a copy of the GNU General Public License
    # along with Foobar.  If not, see <https://www.gnu.org/licenses/>.
    
datey=$(date +%Y)
datey=$((datey+1))
declare -a dates1
declare -a dates

trenteun(){
    mois="$1"
    if [[ "$mois" == "01" ]] || [[ "$mois" == "03" ]]
        then
            result=1
    fi
    if [[ "$mois" == "05" ]] || [[ "$mois" == "07" ]]
        then
            result=1
    fi
    if [[ "$mois" == "08" ]] || [[ "$mois" == "10" ]]
        then
            result=1
    fi
    if [[ "$mois" == "10" ]] || [[ "$mois" == "12" ]] 
        then
            result=1
    fi
   
    if [[ $result -eq 1 ]] 
        then
            true
        else
            false
    fi
}


isleap() 
    { 
        if date -d "$1"-02-29 &>/dev/null
        then
            true 
        else
            false
        fi
    }

indexA=0
dat8()
{
    laps=$1
    
    for (( y=${laps:0:4};y < ${laps:5}+1; y++ ))
    do
    for m in {01..12}
    do
    if trenteun "$m" 
    then
        for d in {01..31}
        do
        dates1["$indexA"]="$y$m$d"
        indexA=$((indexA + 1))
        done
    fi
    if isleap "$y" 
    then
        if [[ $m == 02 ]]
        then
            for d in {01..29}
            do
            dates1["$indexA"]="$y$m$d"
            indexA=$((indexA + 1))
            done
        else
        for d in {01..30}
        do
        dates1["$indexA"]="$y$m$d"
        indexA=$((indexA + 1))
        done
        fi
    else
        if [[ $m == 02 ]]  
        then
            for d in {01..28}
            do
            dates1["$indexA"]="$y$m$d"
            indexA=$((indexA + 1))
            done
        else
        for d in {01..30}
        do
        dates1["$indexA"]="$y$m$d"
        indexA=$((indexA + 1))
        done
        fi
    fi
    done
    done
}
dat7()
{
    laps=$1
    
    for (( y=${laps:0:4};y < ${laps:5}+1; y++ ))
    do
    for m in {01..12}
    do
    if trenteun "$m" 
    then
        for d in {01..31}
        do
        dates1["$indexA"]="$y$m${d:1}"
        indexA=$((indexA + 1))
        dates1["$indexA"]="$y${m:1}$d"
        indexA=$((indexA + 1))
        done
    fi
    if isleap "$y" 
    then
        if [[ $m == 02 ]]
        then
            for d in {01..29}
            do
            dates1["$indexA"]="$y$m${d:1}"
            indexA=$((indexA + 1))
            dates1["$indexA"]="$y${m:1}$d"
            indexA=$((indexA + 1))
            done
        else
        for d in {01..30}
        do
            dates1["$indexA"]="$y$m${d:1}"
            indexA=$((indexA + 1))
            dates1["$indexA"]="$y${m:1}$d"
            indexA=$((indexA + 1))
        done
        fi
    else
        if [[ $m == 02 ]]  
        then
            for d in {01..28}
            do
            dates1["$indexA"]="$y$m${d:1}"
            indexA=$((indexA + 1))
            dates1["$indexA"]="$y${m:1}$d"
            indexA=$((indexA + 1))
            done
        else
        for d in {01..30}
        do
            dates1["$indexA"]="$y$m${d:1}"
            indexA=$((indexA + 1))
            dates1["$indexA"]="$y${m:1}$d"
            indexA=$((indexA + 1))
        done
        fi
    fi
    done
    done
}
dat6()
{
    laps=$1
    
    for (( y=${laps:0:4};y < ${laps:5}+1; y++ ))
    do
    for m in {01..12}
    do
    if trenteun "$m" 
    then
        for d in {01..31}
        do
        dates1["$indexA"]="${y:2}$m$d"
        indexA=$((indexA + 1))
        dates1["$indexA"]="$y${m:1}${d:1}"
        indexA=$((indexA + 1))
        done
    fi
    if isleap "$y" 
    then
        if [[ $m == 02 ]]
        then
            for d in {01..29}
            do
            dates1["$indexA"]="${y:2}$m$d"
            indexA=$((indexA + 1))
            dates1["$indexA"]="$y${m:1}${d:1}"
            indexA=$((indexA + 1))
            done
        else
        for d in {01..30}
        do
            dates1["$indexA"]="${y:2}$m$d"
            indexA=$((indexA + 1))
            dates1["$indexA"]="$y${m:1}${d:1}"
            indexA=$((indexA + 1))
        done
        fi
    else
        if [[ $m == 02 ]]  
        then
            for d in {01..28}
            do
            dates1["$indexA"]="${y:2}$m$d"
            indexA=$((indexA + 1))
            dates1["$indexA"]="$y${m:1}${d:1}"
            indexA=$((indexA + 1))
            done
        else
        for d in {01..30}
        do
            dates1["$indexA"]="${y:2}$m$d"
            indexA=$((indexA + 1))
            dates1["$indexA"]="$y${m:1}${d:1}"
            indexA=$((indexA + 1))
        done
        fi
    fi
    done
    done
} 

dat5()                
{
    laps=$1
    
    for (( y=${laps:0:4};y < ${laps:5}+1; y++ ))
    do
    for m in {01..12}
    do
    if trenteun "$m" 
    then
        for d in {01..31}
        do
        dates1["$indexA"]="${y:2}${m:1}$d"
        indexA=$((indexA + 1))
        dates1["$indexA"]="$y${m:1}"
        indexA=$((indexA + 1))
        dates1["$indexA"]="${y:2}${m}${d:1}"
        indexA=$((indexA + 1))
        done
    fi
    if isleap "$y" 
    then
        if [[ $m == 02 ]]
        then
            for d in {01..29}
            do
            dates1["$indexA"]="${y:2}${m:1}$d"
            indexA=$((indexA + 1))
            dates1["$indexA"]="$y${m:1}"
            indexA=$((indexA + 1))
            dates1["$indexA"]="${y:2}${m}${d:1}"
            indexA=$((indexA + 1))
            done
        else
        for d in {01..30}
        do
            dates1["$indexA"]="${y:2}${m:1}$d"
            indexA=$((indexA + 1))
            dates1["$indexA"]="$y${m:1}"
            indexA=$((indexA + 1))
            dates1["$indexA"]="${y:2}${m}${d:1}"
            indexA=$((indexA + 1))
        done
        fi
    else
        if [[ $m == 02 ]]  
        then
            for d in {01..28}
            do
            dates1["$indexA"]="${y:2}${m:1}$d"
            indexA=$((indexA + 1))
            dates1["$indexA"]="$y${m:1}"
            indexA=$((indexA + 1))
            dates1["$indexA"]="${y:2}${m}${d:1}"
            indexA=$((indexA + 1))
            done
        else
        for d in {01..30}
        do
            dates1["$indexA"]="${y:2}${m:1}$d"
            indexA=$((indexA + 1))
            dates1["$indexA"]="$y${m:1}"
            indexA=$((indexA + 1))
            dates1["$indexA"]="${y:2}${m}${d:1}"
            indexA=$((indexA + 1))
        done
        fi
    fi
    done
    done
}  

dat4()
{   
    laps=$1

    for (( y=${laps:0:4};y < ${laps:5}+1; y++ ))
    do
    for m in {01..12}
    do
    if trenteun "$m" 
    then
        for d in {01..31}
        do
        dates1["$indexA"]="${d:1}${m:1}${y:2}"
        indexA=$((indexA + 1))
        dates1["$indexA"]="$y"
        indexA=$((indexA + 1))
        dates1["$indexA"]="${d:1}${m:1}${y:2}"
        indexA=$((indexA + 1))
        dates1["$indexA"]="${d}${m}"
        indexA=$((indexA + 1))
        done
    fi
    if isleap "$y" 
    then
        if [[ $m == 02 ]]
        then
            for d in {01..29}
            do
            dates1["$indexA"]="${d:1}${m:1}${y:2}"
            indexA=$((indexA + 1))
            dates1["$indexA"]="$y"
            indexA=$((indexA + 1))
            dates1["$indexA"]="${d:1}${m:1}${y:2}"
            indexA=$((indexA + 1))
            dates1["$indexA"]="${d}${m}"
            indexA=$((indexA + 1))
            done
        else
        for d in {01..30}
        do
            dates1["$indexA"]="${d:1}${m:1}${y:2}"
            indexA=$((indexA + 1))
            dates1["$indexA"]="$y"
            indexA=$((indexA + 1))
            dates1["$indexA"]="${d:1}${m:1}${y:2}"
            indexA=$((indexA + 1))
            dates1["$indexA"]="${d}${m}"
            indexA=$((indexA + 1))
        done
        fi
    else
        if [[ $m == 02 ]]  
        then
            for d in {01..28}
            do
            dates1["$indexA"]="${d:1}${m:1}${y:2}"
            indexA=$((indexA + 1))
            dates1["$indexA"]="$y"
            indexA=$((indexA + 1))
            dates1["$indexA"]="${d:1}${m:1}${y:2}"
            indexA=$((indexA + 1))
            dates1["$indexA"]="${d}${m}"
            indexA=$((indexA + 1))
            done
        else
        for d in {01..30}
        do
            dates1["$indexA"]="${d:1}${m:1}${y:2}"
            indexA=$((indexA + 1))
            dates1["$indexA"]="$y"
            indexA=$((indexA + 1))
            dates1["$indexA"]="${d:1}${m:1}${y:2}"
            indexA=$((indexA + 1))
            dates1["$indexA"]="${d}${m}"
            indexA=$((indexA + 1))
        done
        fi
    fi
    done
    done
}
dat3()
{
    laps=$1

    for (( y=${laps:0:4};y < ${laps:5}+1; y++ ))
    do
    for m in {01..12}
    do
    if trenteun "$m" 
    then
        for d in {01..31}
        do
        dates1["$indexA"]="${y:2}${m:1}"
        indexA=$((indexA + 1))
        dates1["$indexA"]="${m}${d:1}"
        indexA=$((indexA + 1))
        done
    fi
    if isleap "$y" 
    then
        if [[ $m == 02 ]]
        then
            for d in {01..29}
            do
            dates1["$indexA"]="${y:2}${m:1}"
            indexA=$((indexA + 1))
            dates1["$indexA"]="${m}${d:1}"
            indexA=$((indexA + 1))
            done
        else
        for d in {01..30}
        do
            dates1["$indexA"]="${y:2}${m:1}"
            indexA=$((indexA + 1))
            dates1["$indexA"]="${m}${d:1}"
            indexA=$((indexA + 1))
        done
        fi
    else
        if [[ $m == 02 ]]  
        then
            for d in {01..28}
            do
            dates1["$indexA"]="${y:2}${m:1}"
            indexA=$((indexA + 1))
            dates1["$indexA"]="${m}${d:1}"
            indexA=$((indexA + 1))
            done
        else
        for d in {01..30}
        do
            dates1["$indexA"]="${y:2}${m:1}"
            indexA=$((indexA + 1))
            dates1["$indexA"]="${m}${d:1}"
            indexA=$((indexA + 1))
        done
        fi
    fi
    done
    done
}

data=$1
lapsDate=$5
lgdt=${#data}
if (( lgdt > 1 ))
then
    for ((i=0;i<lgdt+1;i++))
    do
        if [[ ${data:$i} == 3* ]]
        then
            dat3 "$lapsDate"
            # echo "oui 3"
        fi
        if [[ ${data:$i} == 4* ]]
        then
            dat4 "$lapsDate"
            # echo "oui 4"
        fi
        if [[ ${data:$i} == 5* ]]
        then
            dat5 "$lapsDate"
            # echo "oui 5"
        fi
        if [[ ${data:$i} == 6* ]]
        then
            dat6 "$lapsDate"
        fi
        if [[ ${data:$i} == 7* ]]
        then
            dat7 "$lapsDate"
        fi
        if [[ ${data:$i} == 8* ]]
        then
            dat8 "$lapsDate"
        fi
    done
else
    if [[ ${data} == 3 ]]
        then
            dat3 "$lapsDate"
            # echo "oui 3"
        fi
        if [[ ${data} == 4 ]]
        then
            dat4 "$lapsDate"
            # echo "oui 4"
        fi
        if [[ ${data} == 5 ]]
        then
            dat5 "$lapsDate"
            # echo "oui 5"
        fi
        if [[ ${data} == 6 ]]
        then
            dat6 "$lapsDate"
        fi
        if [[ ${data} == 7 ]]
        then
            dat7 "$lapsDate"
        fi
        if [[ ${data} == 8 ]]
        then
            dat8 "$lapsDate"
        fi
        if [[ ${data} == 9 ]]
        then
            dat3 "$lapsDate"
            dat4 "$lapsDate"
            dat5 "$lapsDate"
            dat6 "$lapsDate"
            dat7 "$lapsDate"
            dat8 "$lapsDate"
        fi
fi


# function year completes
# dat3;dat5;dat4;dat6;dat7;dat8

# dates=( `for i in ${dates1[@]}; do echo $i; done | sort -u` )
dates=( $(for i in "${dates1[@]}"; do echo "$i"; done | sort -u) )

unset dates1

order=$4
case=$3
dict=$2

doWord(){
    file="$dict"
    [ "${2}" ] && cas=$2 || cas=4
    [ "${3}" ] && ord=$3 || ord="all"
    
    
    while IFS= read -r line
    do
        length=${#line}
        majInit=$(echo "${line:0:1}" |tr '[:lower:]' '[:upper:]')
        maj=$(echo "${line}" |tr '[:lower:]' '[:upper:]')
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
        for k in "${dates[@]}"
        do
            echo "$k"
        
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
