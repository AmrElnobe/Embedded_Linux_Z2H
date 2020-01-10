#!/bin/bash
sudo chmod g+w /etc/phonebook
cd /etc/phonebook

if [ ! -e phonebookDB.txt ]
then 
touch phonebookDB.txt
fi 
sudo chmod g+w phonebookDB.txt
if [ ! -e $1]
then
echo" choose :"
echo "-i : insert new contact"
echo "-v : view all contacts "
echo "-s : search for contact"
echo "-e : delete all contact"
echo "-d : delete contact by name"
elif [ $1 = '-i' ]
then
read -p "enter contact name"name
read -p "enter contact number"number
if [ "$number" -eq "$number" ]
then 
echo -n "$name" >> phonebookDB.txt
echo -n "-"
echo "$number" >> phonebookDB.txt
else
echo "phone must be integers"
fi
elif [ $1 = '-v' ]
then 
while IFS= read -r line
do 
IFS='-'
list=( $line )
echo "Name : ${list[0]}"
echo "Number : ${list[1]}"
done <phonebookDB.txt
elif [ $1 = '-s' ]
then
flag=0
read -p "enter a name"search
while IFS= read -r line
do
IFS='-'
list=( $line )
if [ $search = ${list[0]} ]
then
echo "name : ${list[0]}"
echo "number : ${list[1]}"
flag=1
fi
done <phonebookDB.txt
if [ $flag == 0 ]
then
echo "no match"
fi
elif [ $1 = '-e' ]
then
rm phonebookDB.txt
touch phonebookDB.txt 
elif [ $1 = '-d' ]
then
touch tmp
read -p "search for contact"search
while IFS= read -r line 
do
IFS='-'
list=( $line ) 
if [ $search != ${list[0]} ]
then
echo "$line" >>tmp
done <phonebookDB.txt
rm phonebookDB.txt
mv tmp phonebookDB.txt
else 
echo "wrong option"
fi

