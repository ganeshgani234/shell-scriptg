#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then 
    echo "ERROR:: please run this script with root access"
    exit 1 # you can give other than 0
else 
    echo "you are root user"
fi

yum install mysql -y

if [ $? -ne 0 ]
then 
    echo "ERTOR:: Installing mysql is failed"
    exit 1
else
    echo "Installing mysql is success"
fi

yum install git -y

if [ $? -ne 0 ]
then 
    echo "ERTOR:: Installing git is failed"
    exit 1
else
    echo "Installing git is success"
fi