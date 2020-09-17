# crackAddNumber

this script add some number to words with aircrack like : 1word word1 to 99word and word99 
# command: 
    ./crack.sh /home/kali/words.txt |aircrack-ng -b XX:XX:XX:XX:XX:XX -w - /home/kali/handshake.cap
    
# Viper.sh

                      ____   ____.__                                       
                      \   \ /   /|__|_____   ___________  
                       \   Y   / |  \____ \_/ __ \_  __ \ 
                        \     /  |  |  |_| |  ___/|  | \/ 
                         \___/   |__|   __/ \_____\__|    
                                    |__|                
  # Usage: ./viper.sh -d listOFWords.txt <options>                                 
     -d <dictionnary> list of words                                                 
     -c <case> lower:1 Camel:2 UPPER:3 ALL:4                                        
     -o <order> normal <or> reverse <or> all                                        
     -n <speed in k/s> Calcul the number of possibility and time to test them (coming soon)
    
   # command:
        ./viper.sh -d listWords.txt |aircrack-ng -b XX:XX:XX:XX:XX:XX -w - /home/kali/handshake.cap <for all possibilities>
        ./viper.sh -d list.txt -c 2 -o all |aircrack-ng -b XX:XX:XX:XX:XX:XX -w - /home/kali/handshake.cap
