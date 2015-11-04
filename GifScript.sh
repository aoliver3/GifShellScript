#!/bin/bash
clear
user=`(whoami)`
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