#!/bin/bash

: '
 Important notes

 `man test`
 `echo $?`

'

: '
name=$1
echo "Hello $name "

#      Maths
expr 40 + 20
expr 40 - 20
expr 40 / 20
expr 40 \* 20
echo "$((10 + 20))"


#    If Else
mynum=209
if [ $mynum -lt 200 ] # `-eq` for equal to. `-ne` for not equal of `!` in front of statement. `-gt` is for greater than. `-lt` for less than
then
   echo "True"
else
   echo "Flase condition"
fi
if [ -d /workspace/haval/ ] # `-d` for dir check. `-f` for file check. to run cmd without [] run `command -v {cmd}`
then
   echo "exits"
else
   echo "does not exits"
   fi


#   exit  with `exit` we can end the script
if [ -d /etc ]
then
   echo "dic exits"
   exit 0
else
   echo "does not exits"
   exit 1


#     While loop
mynum1=1
while [ $mynum1 -le 10 ]
do
   echo $mynum1
   mynum1=$(( $mynum1 + 1 ))
   sleep .5
done

#    for loop
for i in {1..10}
do
    echo $i
    sleep 1
done 

#     function
printer() {
   echo "Hello everyone! $q"
}
printer() 

#     Case
echo "Choose your character?"
echo "1. introverte"
echo "2. hero"
echo "3. villan"
echo "4. master"
echo "5. ᛗᚨᚺᛗᚢᛞ"
echo -n "your answer : "
read ans # `read` keyword used to read user input.

case $ans in
1) echo "Yolo don't be sad man" ;;
2) echo "Want be hero, huh who do you think you are?" ;;
3) echo "yo boy you are thinking something naughty" ;;
4) echo "want be a master train for decate man" ;;
5) echo "............................... hahahaha" ;;
*) echo "are you a fool ?" ;;
esac "

echo "ehell"