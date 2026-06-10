#!/bin/bash

USERID=$(id -u)


if [ $USERID -ne 0 ]; then 
   echo "Please run the script with root access..."

fi

echo "Please continue the script..."