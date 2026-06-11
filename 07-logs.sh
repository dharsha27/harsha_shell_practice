#!/bin/bash


#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script 
LOGS_FILE="$LOGS_DIR/$0.log"

if [ $USERID -ne 0 ] ; then
   echo "Error: please run this script with root access" | tee -a "$LOGS_FILE"
   exit 1
fi

# create a log directory if it doesnt' exist
mkdir -p /var/log/shell-script 

VALIDATE(){
    if [ $2 -ne 0 ]; then 
          echo "Installing $1 is ....FAILED" | tee -a "$LOGS_FILE"
          exit 1
    else
          echo "Installing $1 is ....SUCCESS" | tee -a "$LOGS_FILE"
    fi

}

dnf list installed mysql &>> "$LOGS_FILE"
# echo "Installing my sql"
if [ $? -eq 0 ]; then 
   echo "MYSQL is Alreaady Installed .. please skip" | tee -a "$LOGS_FILE"

else  
    echo "Installing Mysql " 
    dnf install mysql -y
    VALIDATE "Mysql" $?
fi

Nginx Installation

dnf list installed nginx &>> "$LOGS_FILE"
Nginx_check=$?
echo "Installing my nginx"

if [ $Nginx_check -eq 0 ]; then 
   echo "NGINX is Alreaady Installed .. please skip" | tee -a "$LOGS_FILE"

else  
    echo "Installing NGINX " 
    dnf install nginx -y &>> "$LOGS_FILE"
    VALIDATE "nginx" $?
fi