# _Viper_ will change her name for _rattlesnake.sh_ now ("rtlsnake.sh")
        ![]("crotalep.png")
        <img src="https://w7.pngwing.com/pngs/653/250/png-transparent-rattlesnake-rattlesnake-mammal-animals-carnivoran.png"/>
this script add some number to words with aircrack like : _1word word1 to 99word and word99_ (with -o order option).
with **_lower, Camel_ and _UPPER_ cases** (word,Word and WORD with _-c option_).
**_-t_** is an option to test with all zipcodes of a french department or simply add a custom longer number.
prenoms.txt is a dictionary's names for france (_-d option_).
And **_-b_** is an option for possibles **dates** [1945-2020] (only french's format for the moment) use it with _-l option_ 
(optionnal -m to modify **order** to _**1**:ddmmyy or **2**:yymmdd_)

**example:** -_l 1950-2020_

**please** use _rtlsnake.sh_ because I change the name to RattleSnake (**_rtlsnake.sh_**)
    
## rtlsnake.sh

                    __    __  .__                               __           
     ____________ _/  |__/  |_|  |  _____   ______ ____ _____  |  | _______  
     \_  __ \__  \\   __\   __\  | /  __ \ /  ___//    \\__  \ |  |/ /  __ \  
      |  | \// __ \|  |  |  | |  |_\  ___/ \___ \|   |  \/ __ \|    <\  ___/  
      |__|  (______/__|  |__| |____/\_____>______>___|__(______/__|_ \\_____>
      
  #### Usage: ./rtlsnake.sh -d listOFWords.txt <options>                                 
     -d _<dictionnary>_ **list** of words 
     -k **<numbers to add>** like 2000 for 1..2000 (_default 99_)
     -b **<dates>** all dates possible with (3,4,5,6,7,8 numbers or **9** _for ALL_) 
      ex: **_./rtlsnake.sh -b 4 -l 1950-2001 -c 1 -o normal_**
      or **_./rtlsnake.sh -b 456 -c 1 -o normal_** **456** for 4 number 5 number and 6 
      (**_use with -l option is obligatory_** and _-m_ optionnal)
     -m **<mode dates>** **1**:_ddmmyy_ **2**:_yymmdd_
     -l **<laps>** ex: _-l 1945-2005_ (for _-b option_)
     -c <case> lower:**1** Camel:**2** UPPER:**3** ALL:**4** (_default_ **ALL**)                                       
     -o **<order>** **_normal_** <or> **_reverse_** <or> **_all_** (**default** **_all_**)                                     
     -t for **france add department** _fixed= like 91230_ or all departments's zips of **91** (**default** **_None_**)
     -n future option **<speed in k/s>** Calculate the number of possibilities and time to test them (**coming soon**)
    
   ##### command:
        ./rtlsnake.sh -d listWords.txt |aircrack-ng -b XX:XX:XX:XX:XX:XX -w - /home/kali/handshake.cap <for all possibilities>
        ./rtlsnake.sh -d listWords.txt -k 8600 |aircrack-ng -b XX:XX:XX:XX:XX:XX -w - /home/kali/handshake.cap
        ./rtlsnake.sh -d list.txt -c 2 -o all |aircrack-ng -b XX:XX:XX:XX:XX:XX -w - /home/kali/handshake.cap
        ./rtlsnake.sh -d list.txt -b 34 -o all -c 1 -l 1995-2006 |aircrack-ng -b XX:XX:XX:XX:XX:XX -w - /home/kali/handshake.cap
        
## Crack
simple bash program add some number to words with aircrack like : 1word word1 to 99word and word99.
with lower Camel and UPPER cases.
##### command: 
    ./crack.sh /home/kali/words.txt |aircrack-ng -b XX:XX:XX:XX:XX:XX -w - /home/kali/handshake.cap

