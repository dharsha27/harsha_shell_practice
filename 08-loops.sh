#!/bin/bash 

# for num in {1..50}
# do 
#     echo $num
# done

set -e
USERID=$(id -u)
SCRIPT_NAME=$(basename "$0")
LOGS_DIR=/var/log/shell-script 
LOGS_FILE="$LOGS_DIR/$SCRIPT_NAME.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# colours

RED="\e[31m]"
GREEN="\e[32m]"
YELLOW="\e[33m]"
NORMAL="\e[0m]"

trap 'echo "error at $LINENO, command:$BASH_COMMAND" ' ERR


if [ $USERID -ne 0 ] ; then
   echo "Error: please run this script with root access" | tee -a "$LOGS_FILE"
   exit 1
fi

# create a log directory if it doesnt' exist
mkdir -p /var/log/shell-script 

VALIDATE(){
    if [ $2 -ne 0 ]; then 
          echo -e "$TIMESTAMP [Error] Installing $1 is ....$RED FAILED $NORMAL" | tee -a "$LOGS_FILE"
          exit 1
    else
          echo -e "$TIMESTAMP {[INFO] Installing $1 is ....$GREEN SUCCESS $NORMAL" | tee -a "$LOGS_FILE"
    fi

}

for package in "$@"
do 

    echo "$TIMESTAMP {[INFO] Installing $package"
    dnf list installed "$package" &>> "$LOGS_FILE" 
    
    if [ $? -ne 0 ] ; then 
       dnf install "$package" -y &>> "$LOGS_FILE"
       VALIDATE "Installling $package" $?
    else
       
        echo -e " $TIMESTAMP [INFO] $package is  already installed ....$YELLOW skip $NORMAL" | tee -a "$LOGS_FILE"

    fi


done