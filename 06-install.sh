#!/bin/bash

USERID=$(id -u)


if [ $USERID -ne 0 ]; then 
   echo "Please run the script with root access..."
#    exit 1
fi

VALIDATE(){
    if [ $2 -ne 0 ]; then 
   
          echo "Installing $1 is ....FAILED"
          exit 1

    else
          echo "Installing $1 is ....SUCCESS"
    fi

}


echo "Installing my sql"
if [ $? -eq 0 ]; then 
   echo "MYSQL is Alreaady Installed .. please skip"

else  
    echo "Installing Mysql " 
    dnf install mysql -y
    VALIDATE Mysql $?

    

fi