#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "ERTOR:: $2 ... FAILED"
        exit 1
    else
        echo "$2 ... success"
    fi

}

if [ $ID -ne 0 ]
then 
    echo "ERROR:: please run this script with root access"
    exit 1 # you can give other than 0
else 
    echo "you are root user"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "Installing MYSQL"

yum install git -y &>> $LOGFILE

VALIDATE $? "installing GIT"