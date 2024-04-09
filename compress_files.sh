#!/bin/bash

echo 'Give me the path of the DIR you want to compress Enter for the current DIR'
echo -n '==> ' 
read userChoice

dirPath=$(pwd)
if [ ! -z "$userChoice" ];then
    dirPath="$userChoice"
fi

defaultZipDirName="Collection.zip"
echo "Type the ZIP DIR Name you want | Enter for default(Collection.zip)"
echo -n "==> "
read userZipDirName

if [ ! -z "$userZipDirName" ];then
    echo "from if and the string is emtpy"
    defaultZipDirName="$userZipDirName"
fi

delteChoice='N'
userDidNotChoose= true
while [ $userDidNotChoose ];do
    echo 'Do you want to Delete the DIR after compressing it?'
    echo -n 'No is the default choice y|N: '
    read userDeleteChoice
    if [ "$userDeleteChoice" == 'y' ] || [ "$userDeleteChoice" == 'N' ] || [ "$userDeleteChoice" == '' ];then
        userDidNotChoose=false
        delteChoice=$((userDeleteChoice))
    else    
        echo "choose a valid option between (y | N)"
    fi
done
allFilesList=""
for file in "$dirPath"/*; do
    zip "$defaultZipDirName" $file 1>/dev/null 2>&1
done

echo "Compressing Files at $dirPath..."
echo "Collection Files..."
echo "Compresing is done."
