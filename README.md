# Viper

this script add some number to words with aircrack like : 1word word1 to 99word and word99 (with -o order option).

with lower Camel and UPPER cases (word,Word and WORD with -c option).

-t is an option to test with all zipcodes of a french department or simply add a custom longer number.

prenoms.txt is a dictionary's names for france (-d option).

And -b is an option for possibles dates (only french's format for the moment)
    
# Viper.sh

                      ____   ____.__                                       
                      \   \ /   /|__|_____   ___________  
                       \   Y   / |  \____ \_/ __ \_  __ \ 
                        \     /  |  |  |_| |  ___/|  | \/ 
                         \___/   |__|   __/ \_____\__|    
                                    |__|                
  # Usage: ./viper.sh -d listOFWords.txt <options>                                 
     -d <dictionnary> list of words 
     -k number to add like 2000 for 1..2000 (default 99)
     -b date all dates possible with (3,4,5,6,7,8 numbers or 9 for ALL) ex: ./viper.sh -b 4 -c 1 -o normal
     -c <case> lower:1 Camel:2 UPPER:3 ALL:4 (default ALL)                                       
     -o <order> normal <or> reverse <or> all (default all)                                     
     -t for france add department fixed like 91230 or all department's zip of 91 (default None)
     -n <speed in k/s> Calcul the number of possibility and time to test them (coming soon)
    
   # command:
        ./viper.sh -d listWords.txt |aircrack-ng -b XX:XX:XX:XX:XX:XX -w - /home/kali/handshake.cap <for all possibilities>
        ./viper.sh -d list.txt -c 2 -o all |aircrack-ng -b XX:XX:XX:XX:XX:XX -w - /home/kali/handshake.cap
        
# Crack
simple bash program add some number to words with aircrack like : 1word word1 to 99word and word99.
with lower Camel and UPPER cases.
# command: 
    ./crack.sh /home/kali/words.txt |aircrack-ng -b XX:XX:XX:XX:XX:XX -w - /home/kali/handshake.cap

