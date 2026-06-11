#!/bin/bash 

# for num in {1..50}
# do 
#     echo $num
# done


USERID=$(id -u)
SCRIPT_NAME=$(basename "$0")
LOGS_DIR=/var/log/shell-script 
LOGS_FILE="$LOGS_DIR/$SCRIPT_NAME.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

if [ $USERID -ne 0 ] ; then
   echo "Error: please run this script with root access" | tee -a "$LOGS_FILE"
   exit 1
fi

# create a log directory if it doesnt' exist
mkdir -p /var/log/shell-script 

VALIDATE(){
    if [ $2 -ne 0 ]; then 
          echo "$TIMESTAMP [Error] Installing $1 is ....FAILED" | tee -a "$LOGS_FILE"
          exit 1
    else
          echo "$TIMESTAMP {[INFO] Installing $1 is ....SUCCESS" | tee -a "$LOGS_FILE"
    fi

}

for package in "$@"
do 

    echo "Installing $package"
    dnf list installed "$package" &>> "$LOGS_FILE"
    
    if [ $? -ne 0 ] ; then 
       dnf install "$package" -y &>> "$LOGS_FILE"
       VALIDATE "Installling $package" $?
    else
       
        echo " $TIMESTAMP {[INFO] $package is  already installed ....skip " | tee -a "$LOGS_FILE"

    fi


done