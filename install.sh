#!/bin/bash

if echo "monarc" > /usr/bin/test
then
    rm /usr/bin/test
    result=0
else
    result=1
fi

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
    cp *.sh CPFrance.txt /usr/bin
    echo -e "install rtlsnake DONE.\n"
    tput setaf 6
    echo -e "Now you can run rtlsnake by the command rtlsnake.sh"
    tput setaf 7
else
    tput setaf 1
    echo -e  "\n\nplease use sudo or root user to install ex: sudo ./install.sh"
    tput setaf 7
fi
