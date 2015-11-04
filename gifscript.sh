#!/bin/bash
clear
user=`(whoami)`
echo 
echo
echo "  ____ _  __ ____            _       _         _"
sleep 0.3
echo " / ___(_)/ _/ ___|  ___ _ __(_)_ __ | |_   ___| |__"  
sleep 0.3
echo "| |  _| | |_\___ \ / __| '__| | '_ \| __| / __| '_ \ " 
sleep 0.3
echo "| |_| | |  _|___) | (__| |  | | |_) | |_ _\__ \ | | | "
sleep 0.3
echo " \____|_|_| |____/ \___|_|  |_| .__/ \__(_)___/_| |_| "
sleep 0.3
echo "                              |_| "                    
sleep 0.3
echo
sleep 0.3
echo
sleep 0.3
echo "Created by..."
sleep 0.3
echo
sleep 0.3
echo
sleep 0.3
echo "       d8888        888       .d8888b.         888888 "                
sleep 0.3
echo "      d88888        888      d88P  '88b          '88b "                
sleep 0.3
echo "     d88P888        888      Y88b. d88P           888 "                
sleep 0.3
echo "    d88P 88888888b. 888888    'Y8888P'            888 .d88b.  .d88b. " 
sleep 0.3
echo "   d88P  888888 '88b888      .d88P88K.d88P        888d88''88bd8P  Y8b "
sleep 0.3
echo "  d88P   888888  888888      888'  Y888P'         888888  88888888888 "
sleep 0.3
echo " d8888888888888  888Y88b.    Y88b .d8888b         88PY88..88PY8b.     "
sleep 0.3
echo "d88P     888888  888 'Y888    'Y8888P' Y88b       888 'Y88P'  'Y8888 " 
sleep 0.3
echo "                                                .d88P "                
sleep 0.3
echo "                                              .d88P'  "                
sleep 0.3
echo "                                             888P'    "               
sleep 1
echo
echo
echo "Hello" $user
echo
echo "What type of gifs do you want to download?"
echo
read input 
echo
echo "Looking for $input gifs..."
echo
#This grabs pages with the users input
curl http://giphy.com/search/$input | grep 'url: ' | cut -d'/' -f3 | rev | cut -c 3- | rev > templinks
echo
echo "Gifs located. How many do you want to download? (max=25)"
echo
#number of gifs to download
read num
echo
echo "Downloading $num $input gifs..."
echo
#shortens the list to the requested number of files to download
cat templinks | head -n$num > linkfile

#creates a unique directory to store the gifs
mkdir gifs_$input

#This method grabs the requested number of links to download
for x in `cat linkfile`
do
    link=`curl http://giphy.com/gifs/$x | grep 'input type="text" value=' | tail -n1 | cut -d'"' -f4`
    curl $link > ./gifs_$input/$x.gif
done

#remove temp files
rm linkfile
rm templinks

echo
echo "Gifs Downloaded!"
echo