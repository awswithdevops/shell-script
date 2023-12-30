#!/bin/bash

ID=$(id -u) 
TIMESTAMP=$( date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


LOGFILE="/tmp/$0-$TIMESTAMP.log"
echo "Script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]
then
    echo -e" ERROR: $2... $R failed $N"
    exit 1 # you can give other than 0
else
    echo -e" $2...$G scucess $N"
fi
}

if [ $ID -ne 0 ]
then
    echo "ERROR:pleae run with root access  "
    exit 1 # you can give other than 0
else
    echo " Root user "
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "instll myql"

yum install git -y &>> $LOGFILE

VALIDATE $? "instll git"