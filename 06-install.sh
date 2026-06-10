#!/bin/bash

USERID=$(id -u)


if [ $USERID -ne 0 ]; then 
   echo "Please run the script with root access..."
#    exit 1
fi




echo "Installing my sql"
if [ $? -eq 0 ]; then 
   echo "MYSQL is Alreaady Installed .. please skip"

else   
    dnf install mysql -y

    if [ $? -ne 0 ]; then 
   
          echo "Installing mysql is ....FAILED"
          exit 1

    else
          echo "Installing MYSQL is ....SUCCESS"
    fi

fi