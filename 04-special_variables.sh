#!/bin/bash

echo "All variables passed on the script.:: $@"
echo "Number of variables passed :: $#"
echo "First variables  :: $1"
echo "script name :: $0"
echo "who is the user :: $USER"
echo "which directory:: $PWD"

echo "PID of the linux script:: $$" 
sleep  5 &


echo "PID of the  background linux script:: $!" 
wait $!
echo "Line no :: $LINENO" 
echo "Script executed in seconds:: $SECONDS seconds" 

echo "Generate a random num::$RANDOM"