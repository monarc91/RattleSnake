#!/bin/bash

# Author : Teddy Skarin 
# name: ProgressBar 1980's style

# 1. Create ProgressBar function
# 1.1 Input is currentState($1) and totalState($2)
ProgressBar (){
# Process data
	let _progress=(${1}*100/${2}*100)/100
	let _done=(${_progress}*4)/10
	let _left=40-$_done
# Build progressbar string lengths
	_done=$(printf "%${_done}s")
	_left=$(printf "%${_left}s")

# 1.2 Build progressbar strings and print the ProgressBar line
# 1.2.1 Output example:
# 1.2.1.1 Progress : [########################################] 100%
printf "\rProgress : [${_done// /#}${_left// /-}] ${_progress}%%"

}

# Variables
_start=1

# This accounts as the "totalState" variable for the ProgressBar function
_end=5


if echo "monarc" > /usr/bin/test
then
    rm /usr/bin/test
    result=0
else
    result=1
fi

files=( rtlsnake.sh dateFR.sh dateUS.sh dateMO.sh CPFrance.txt )

if [[ $result == 0 ]]
then
    tput setaf 2
    echo "                  __    __   __                              __               "          
    echo "   ____________ _/  |__/  |_|  |  _____  ______ ____ _____  |  | __ ____      "
    echo "   \_  __ \__  \\\\   __\   __\  | /  __ \/  ___//    \\\\__  \ |  |/ // __ \\";tput setaf 6
    echo "    |  | \// __ \|  |  |  | |  |_\\  ___/\___ \|   |  \/ __ \|    <\  ___/    ";tput setaf 3
    echo "    |__|  (______/__|  |__| |____/\\_____>_____>___| _(______/__|__\\\\____> ";tput setaf 4
    echo "                                                                              "
    echo " Licence: GPL3                                                                "
    echo " RattleSnake par Monarc(Marc Segur)                                           "
    echo " Copyright: 2020                                               Version: 0.9.2 "
    echo "------------------------------------------------------------------------------"
    tput setaf 7
    echo -e "install rtlsnake...\n"

    for fil in "${!files[@]}"
    do
        cp "${files[$fil]}" /usr/bin 
        tput setaf 6
        ProgressBar "$(($fil+1))" $_end
        sleep 0.5
    done
   
    
    tput setaf 3
    printf '\n\nFinished!\n'
    echo -e "install rtlsnake DONE.\n"
    tput setaf 6
    echo -e "Now you can run rtlsnake by the command rtlsnake.sh"
    tput setaf 7
else
    tput setaf 1
    echo -e  "\n\nplease use sudo or root user to install ex: sudo ./install.sh"
    tput setaf 7
fi
