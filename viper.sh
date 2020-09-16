#!/bin/bash

while getopts ":c:o:f:d:n:" opt; do
    case ${opt} in
        c )
          casef="${OPTARG}"
          ;;
        o )
          order=${OPTARG}
          ;;
        f )
          format=${OPTARG}
          ;;
        d )
          dict=${OPTARG}
          ;;
        n )
          nb=${OPTARG}
          ;;
      
        \? )
          echo "Invalid Option: -$OPTARG" 1>&2
          exit 1
          ;;
    esac
done
shift $((OPTIND -1))
       echo "                       ____   ____.__                      "                  
       echo "                       \   \ /   /|__|_____   ___________  "
       echo "                        \   Y   / |  \____ \_/ __ \_  __ \ "
       echo "                         \     /  |  |  |_| |  ___/|  | \/ "
       echo "                          \___/   |__|   __/ \_____\__|    "
       echo "                                     |__|                  "

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
    echo -e " #   -o <order> normal <or> reverse <or> all                                         #"
    echo -e " #   -n <speed in k/s> Calcul the number of possibility and time to test them       #"
    echo -e " #__________________________________________________________________________________#\n"
    exit 1
fi
echo "la casse est: ${casef}"
echo "l'ordre est: ${order}"
echo "le format est: ${format}"
echo "la liste est lÃ : ${dict}"
echo "compte nombre de possibilitÃ©es en: ${nb}"

if [ -z "$casef" ];then
    echo "not -c set"
  else
    echo "casef vaut ${casef}"
fi


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
        for k in {1..2}
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

doWord "$dict" "$casef" "$order"
