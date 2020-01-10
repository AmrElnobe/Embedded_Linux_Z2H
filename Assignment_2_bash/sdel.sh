#! /bin/bash

if [ ! -e ~/TRASH ]
then
mkdir ~/TRASH
fi
for i in $@ 
do
if [ -d $i ]
then
tar -czf ft $i
mv ft ~/TRASH
rm $i
elif [ -f $i ]
then
if [[ $? -eq 0 ]] 
then 
echo " file is compressed"
mv $i ~/TRASH 
else 
tar -czf $i $i
mv $i ~/TRASH
fi 
else 
echo"$i doesnot exist"
fi
done
find ~/TRASH -mtime +2 -type f -exec rm {} \;
