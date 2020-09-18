#!/bin/bash

while getopts ":c:o:f:d:n:t:" opt; do
    case ${opt} in
        c )
          casef="${OPTARG}"
          ;;
        t )
          dept="${OPTARG}"
          ;;
        o )
          order=${OPTARG}
          ;;
        f )
          format=${OPTARG}
          echo " coming soon"
          exit 0
          ;;
        d )
          dict=${OPTARG}
          ;;
        n )
          nb=${OPTARG}
          echo " coming soon"
          exit 0
          ;;
      
        \? )
          echo    " Invalid Option: -$OPTARG" 1>&2
          echo    " #==================================================================================#"
          echo -e " #   Usage: ./viper.sh -d listOFWords.txt <options>                                 #"
          echo -e " #   -d <dictionnary> list of words                                                 #"
          echo -e " #   -c <case> lower:1 Camel:2 UPPER:3 ALL:4                                        #" 
          echo -e " #   -o <order> normal <or> revert <or> all                                         #"
          echo -e " #   -t french department like 91 for all 91xxx zipcodes or a fixed longer number   #"
          echo -e " #    for a unique number to add                                                    #"
          echo -e " #   -n <speed in k/s> Calcul the number of possibility and time to test them       #"
          echo -e " #__________________________________________________________________________________#\n"
          exit 1
          ;;
    esac
done
shift $((OPTIND -1))
tput setaf 2
       echo "                       ____   ____.__                      "                  
       echo "                       \   \ /   /|__|_____   ___________  "
       echo "                        \   Y   / |  \____ \_/ __ \_  __ \ "
       echo "                         \     /  |  |  |_| |  ___/|  | \/ "
       echo "                          \___/   |__|   __/ \_____\__|    "
       echo "                                     |__|                  "
tput setaf 7

if [ $nb ]
then
    nbWords=`< $dict wc -l`
    echo "nombre de mots dans $dict: $nbWords"
    if [ "$casef" ] && [ !"$order" ]
    then
        :
      else
        result=$(($nbWords*9))
        echo " $result possibilities! at $nb k/s"
        exit 0
    fi
fi

if [ "$dict" ]
then
    :
  else
      
    echo    " #==================================================================================#"
    echo -e " #   Usage: ./viper.sh -d listOFWords.txt <options>                                 #"
    echo -e " #   -d <dictionnary> list of words                                                 #"
    echo -e " #   -c <case> lower:1 Camel:2 UPPER:3 ALL:4                                        #" 
    echo -e " #   -o <order> normal <or> revert <or> all                                         #"
    echo -e " #   -t french department like 91 for all 91xxx zipcodes or a fixed longer number   #"
    echo -e " #    for a unique number to add                                                    #"
    echo -e " #   -n <speed in k/s> Calcul the number of possibility and time to test them       #"
    echo -e " #__________________________________________________________________________________#\n"
    exit 1
fi

departements="CPFrance.txt"

# tableau des departements souhaités
declare -a depart

# get all french departements of this dept
terr() {
  j=0
  dept=$1
  while IFS= read -r line
    do
    if [ ${#dept} -gt 2 ];then
      depart[0]=$dept
    else
      if [[ $line == $dept* ]];then
          depart[$j]=$line
          j=$((j + 1))
      fi
    fi
    done < "$departements"
}

# or just keep the number
if [[ ! -z $dept ]]
then
  if [[ ${#dept} > 2 ]]
  then
    :
   else
    terr $dept
  fi
fi

doWord(){
    file="$1"
    # set default value of $casef and $order to all and 4 or get its fro args
    [ ${2} ] && cas=$2 || cas=4
    [ ${3} ] && ord=$3 || ord="all"
    terre=$4

    while IFS= read -r line
    do
        length=${#line}
        majInit=`echo ${line:0:1} |tr '[:lower:]' '[:upper:]'`
        maj=`echo ${line} |tr '[:lower:]' '[:upper:]'`
        if  [[ $cas -eq 1 && -z "$terre" ]] 
        then
          echo "$line"
        fi
        if [[ $cas -eq 2 && -z "$terre" ]]
        then
          echo "$majInit${line:1:length}" # MAJ-word
        fi
        if [[ $cas -eq 3 && -z "$terre" ]]
        then
          echo "${maj}"
        fi
        if [[ $cas -eq 4 && -z "$terre" ]]
        then
          echo "$line"
          echo "$majInit${line:1:length}" # MAJ-word
          echo "${maj}"
        fi
        # cases of territoire (departements) is set
        if [[ $cas -eq 1 && ! -z "$terre" && "$ord" == "all" ]]
        then
          echo "$line"
          if [ "${#terre}" -gt 2 ]
          then
            echo "$line$terre"
            echo "$terre$line"
          else 
            
            for p in "${depart[@]}"
              do
                echo "$line$p"
                echo "$p$line"
              done
          fi
        fi
        if [[ $cas -eq 2 && ! -z "$terre" && "$ord" == "all" ]]  
        then
          echo "$majInit${line:1:length}" # MAJ-word
          if [ "${#terre}" -gt 2 ]
          then
            echo "$majInit${line:1:length}$terre" # MAJ-word
            echo "$terre$majInit${line:1:length}" # MAJ-word
          else 
            
            for p in "${depart[@]}"
              do
                echo "$majInit${line:1:length}$p" # MAJ-word
                echo "$p$majInit${line:1:length}" # MAJ-word
              done
          fi
        fi
        if [[ $cas -eq 3 && ! -z "$terre" && "$ord" == "all" ]]  
        then
          echo "${maj}"
          if [ "${#terre}" -gt 2 ]
          then
            echo "${maj}$terre"
            echo "$terre${maj}"
          else 
            
            for p in "${depart[@]}"
              do
                echo "${maj}$p"
                echo "$p${maj}"
              done
          fi
        fi
        if [[ $cas -eq 4 && ! -z "$terre" && "$ord" == "all" ]] 
        then
          echo "$line"
          echo "$majInit${line:1:length}" # MAJ-word
          echo "${maj}"
          if [ "${#terre}" -gt 2 ]
          then
            echo "$line$terre"
            echo "$majInit${line:1:length}$terre" # MAJ-word
            echo "$terre$line"
            echo "$terre$majInit${line:1:length}" # MAJ-word
            echo "${maj}$terre"
            echo "$terre${maj}"
          else  
            for p in "${depart[@]}"
              do
                echo "$line$p"
                echo "$majInit${line:1:length}$p" # MAJ-word
                echo "$p$line"
                echo "$p$majInit${line:1:length}" # MAJ-word
                echo "${maj}$p"
                echo "$p${maj}"
              done
          fi
        fi
          if [[ $cas -eq 1 && ! -z "$terre" && "$ord" == "normal" ]]
        then
          echo "$line"
          if [ "${#terre}" -gt 2 ]
          then
            echo "$line$terre"
          else 
            
            for p in "${depart[@]}"
              do
                echo "$line$p"
              done
          fi
        fi
        if [[ $cas -eq 2 && ! -z "$terre" && "$ord" == "normal" ]]  
        then
          echo "$majInit${line:1:length}" # MAJ-word
          if [ "${#terre}" -gt 2 ]
          then
            echo "$majInit${line:1:length}$terre" # MAJ-word
          else 
            
            for p in "${depart[@]}"
              do
                echo "$majInit${line:1:length}$p" # MAJ-word
              done
          fi
        fi
        if [[ $cas -eq 3 && ! -z "$terre" && "$ord" == "normal" ]]  
        then
          echo "${maj}"
          if [ "${#terre}" -gt 2 ]
          then
            echo "${maj}$terre"
          else 
            
            for p in "${depart[@]}"
              do
                echo "${maj}$p"
              done
          fi
        fi
        if [[ $cas -eq 4 && ! -z "$terre" && "$ord" == "normal" ]] 
        then
          echo "$line"
          echo "$majInit${line:1:length}" # MAJ-word
          echo "${maj}"
          if [ "${#terre}" -gt 2 ]
          then
            echo "$line$terre"
            echo "$majInit${line:1:length}$terre" # MAJ-word
            echo "${maj}$terre"
          else  
            for p in "${depart[@]}"
              do
                echo "$line$p"
                echo "$majInit${line:1:length}$p" # MAJ-word
                echo "${maj}$p"
              done
          fi
        fi
          if [[ $cas -eq 1 && ! -z "$terre" && "$ord" == "reverse" ]]
        then
          echo "$line"
          if [ "${#terre}" -gt 2 ]
          then
            echo "$terre$line"
          else 
            
            for p in "${depart[@]}"
              do
                echo "$p$line"
              done
          fi
        fi
        if [[ $cas -eq 2 && ! -z "$terre" && "$ord" == "reverse" ]]  
        then
          echo "$majInit${line:1:length}" # MAJ-word
          if [ "${#terre}" -gt 2 ]
          then
            echo "$terre$majInit${line:1:length}" # MAJ-word
          else 
            
            for p in "${depart[@]}"
              do
                echo "$p$majInit${line:1:length}" # MAJ-word
              done
          fi
        fi
        if [[ $cas -eq 3 && ! -z "$terre" && "$ord" == "reverse" ]]  
        then
          echo "${maj}"
          if [ "${#terre}" -gt 2 ]
          then
            echo "$terre${maj}"
          else 
            
            for p in "${depart[@]}"
              do
                echo "$p${maj}"
              done
          fi
        fi
        if [[ $cas -eq 4 && ! -z "$terre" && "$ord" == "reverse" ]] 
        then
          echo "$line"
          echo "$majInit${line:1:length}" # MAJ-word
          echo "${maj}"
          if [ "${#terre}" -gt 2 ]
          then
            echo "$terre$line"
            echo "$terre$majInit${line:1:length}" # MAJ-word
            echo "$terre${maj}"
          else  
            for p in "${depart[@]}"
              do
                echo "$p$line"
                echo "$p$majInit${line:1:length}" # MAJ-word
                echo "$p${maj}"
              done
          fi
        fi
        for k in {1..99}
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

doWord "$dict" "$casef" "$order" "$dept"

# le crime est toujours punit!
