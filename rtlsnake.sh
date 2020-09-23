#!/bin/bash
    #--------------------------------------------------------------------------#
    #                __    __  .__                               __            #
    # ____________ _/  |__/  |_|  |  _____   ______ ____ _____  |  | _______   #
    # \_  __ \__  \\   __\   __\  | /  __ \ /  ___//    \\__  \ |  |/ /  __ \  #
    #  |  | \// __ \|  |  |  | |  |_\  ___/ \___ \|   |  \/ __ \|    <\  ___/  #
    #  |__|  (______/__|  |__| |____/\_____>______>___|__(______/__|_ \\_____> #
    #                                                                          #
    #                                                                          #
    #==========================================================================#
    #   viper.sh                                                               #
    #   VIPER to accommodate dictionnary                                       #
    #   Author: Monarc(Marc Segur)                                             #
    #   Contact: pc-mac@mail.com                                               # 
    #   Date: 15 september 2020                                                #
    #   Version: 0.9.0                                                         #
    #   Licence:  GPL3                                                         #
    #   Copyright: Monarc(c)2020                                               #
    #__________________________________________________________________________#

    # This program (RattleSnake) is free software: you can redistribute it
    # and/or modify it under the terms of the GNU General Public License 
    # as published by the Free Software Foundation, either version 3 of the License,
    # or (at your option) any later version.

    # This program is distributed in the hope that it will be useful,
    # but WITHOUT ANY WARRANTY; without even the implied warranty of
    # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    # GNU General Public License for more details.

    # You should have received a copy of the GNU General Public License
    # along with this program(RattleSnake).
    # If not, see <https://www.gnu.org/licenses/>.


while getopts ":c:o:f:d:n:t:k:b:l:" opt; do
    case ${opt} in
        c )
          casef="${OPTARG}"
          ;;
        b )
          longueurMAXDate="${OPTARG}"
          ;;
        l )
          lapsDate="${OPTARG}"
          ;;
        k )
          numberTOAdd="${OPTARG}"
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
          if [[ ! -f $dict ]]
          then 
          echo "-d no such file (not exist)"
          exit 1
          fi
          ;;
        n )
          nb=${OPTARG}
          echo " coming soon"
          exit 0
          ;;
      
        \? )
          echo    " Invalid Option: -$OPTARG" 1>&2
          tput setaf 3  
            echo    "#===============================================================================#"
            echo -e "#   Usage: ./viper.sh -d listOFWords.txt <options>                              #"
            echo -e "#   -d <dictionnary> list of words                                              #"
            echo -e "#   -c <case> lower:1 Camel:2 UPPER:3 ALL:4                                     #" 
            echo -e "#   -o <order> normal <or> revert <or> all                                      #"
            echo -e "#   -t french department like 91 for all 91xxx zipcodes or a fixed longer       #"
            echo -e "#    number for a unique number to add                                          #"
            echo -e "#   -b for multipe number ex 357 for 3, 5 and 7 formating (use with -l)         #"
            echo -e "#   -l laps of dates ex: -l 1945-2000 for dates since 1945 to 2000              #"
            echo -e "#   -n <speed in k/s> Calcul the number of possibility and time to test them    #"
            echo -e "#_______________________________________________________________________________#\n"
          tput setaf 7
          exit 1
          ;;
    esac
done
shift $((OPTIND -1))
tput setaf 2
echo "                  __    __   __                               __              "          
echo "   ____________ _/  |__/  |_|  |  _____   ______ ____ _____  |  | _______     "
echo "   \_  __ \__  \\\\   __\   __\  |_/  __ \ /  ___//    \\\\__  \ |  |/ /  __ \\";tput setaf 5
echo "    |  | \// __ \|  |  |  | |  |_\  ___/ \___ \|   |  \/ __ \|    <\  ___/    ";tput setaf 3
echo "    |__|  (______/__|  |__| |____/\_____>______>___|  (______/__|__\\\\_____> ";tput setaf 4
echo ""
echo " Licence: GPL3                                                              "
echo " Viper par Monarc(Marc Segur)                                               "
echo " Copyright: 2020                                               Version: 0.8.0 "
echo "------------------------------------------------------------------------------"
tput setaf 7

if [[ ! -z $longueurMAXDate && ! -z $numberTOAdd ]]
then
    echo "dont use -k option with -b dates otions"
    exit 0
fi
if [[ ! -z $longueurMAXDate && ! -z $dept ]]
then
    echo "dont use -t option with -b dates otions"
    exit 0
fi
if [[ ! -z $longueurMAXDate &&  -z $lapsDate ]]
then
    echo "Use -l \"1950-1952\" option with -b dates options"
    exit 0
fi
if [[ ! -z $lapsDate &&  -z $longueurMAXDate ]]
then
    echo "Use -b 3 or 345 or 456 for multiple length of dates with -l dates laps options only"
    exit 0
fi
if [[ ! -z $longueurMAXDate && ! -z $dict ]] && [[ ! -z $lapsDate ]]
then
    if [[ $longueurMAXDate =~ ^[0-9]+$ ]]; then
          if [[ $lapsDate =~ ^[0-9]{4}-[0-9]{4}$ ]]; then
              [ $casef ]&& : || casef=4
              [ $order ]&& : || order="normal"
              [ $lapsDate ]&& : || lapsDate="1950-2020"
              ./date.sh $longueurMAXDate $dict $casef $order $lapsDate
              exit 0
          else
              echo "bad -l arguments must be year+since-future+year"
              exit 1
          fi
    else
          echo "bad -b arguments must be 3 to 8 and you can sticks them like 345"
          exit 1
    fi 
fi

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
    tput setaf 3  
    echo    "#===============================================================================#"
    echo -e "#   Usage: ./viper.sh -d listOFWords.txt <options>                              #"
    echo -e "#   -d <dictionnary> list of words                                              #"
    echo -e "#   -c <case> lower:1 Camel:2 UPPER:3 ALL:4                                     #" 
    echo -e "#   -o <order> normal <or> revert <or> all                                      #"
    echo -e "#   -t french department like 91 for all 91xxx zipcodes or a fixed longer       #"
    echo -e "#    number for a unique number to add                                          #"
    echo -e "#   -b for multipe number ex 357 for 3, 5 and 7 formating (use with -l)         #"
    echo -e "#   -l laps of dates ex: -l 1945-2000 for dates since 1945 to 2000              #"
    echo -e "#   -n <speed in k/s> Calcul the number of possibility and time to test them    #"
    echo -e "#_______________________________________________________________________________#\n"
    tput setaf 7
    exit 1
fi

departements="CPFrance.txt"

declare -a depart
terr() {
  j=0
  dept=$1
  while IFS= read -r line
    do
    
      if [[ $line == $dept* ]];then
          depart[$j]=$line
          j=$((j + 1))
      fi
    
    done < "$departements"
}
echo $dept
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
    [ ${2} ] && cas=$2 || cas=4
    [ ${3} ] && ord=$3 || ord="all"
    terre=$4
    [ $5 ] && number=$5 || number=99

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
            echo "$terre$line"
            echo "$terre$majInit${line:1:length}" # MAJ-word
            echo "${maj}$terre"
            echo "$terre${maj}"
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
        for ((k=0; k<$number; k++))
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

doWord "$dict" "$casef" "$order" "$dept" "$numberTOAdd"

# le crime est toujours punit!
