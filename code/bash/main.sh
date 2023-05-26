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
fi '
if [ -d /workspace/haval/ ] # `-d` for dir check. `-f` for file check. to run cmd without [] run `command -v {cmd}`
then
   echo "exits"
else
   echo "does not exits"
   fi