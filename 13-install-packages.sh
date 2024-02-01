#!bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M_%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started executing at $TIMESTAMP" &>> $LOGFILE
VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 ... $R FAILED $N"
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then 
    echo -e "$R ERROR:: please run this script with root access $N"
    exit 1 # you can give other than 0
else 
    echo "you are root user"
fi

#echo "All arguments passed: $@"
# git mysql postfix net-tools
# package=git fot first time 
#package=mysql for second time

for package in $@
do
    yum list installed $package &>> $LOGFILE # check installed or not
    if [ $? -ne 0 ] #if not installed
    then 
        yum install $package -y &>> $LOGFILE # install the package
        VALIDATE $? "Installation of $package" # validate
    else
        echo -e "$package is alredy installed ... $Y SKIPPING $N"
    fi
done