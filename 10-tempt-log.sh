#!/bin/bash

ID=$(id -u) 
TIMESTAMP=$( date +%F-%H-%M-%S)
R=\e[31m
G=\e[32m
Y=\e[33m
N=\e[0m


LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
then
    echo "$R ERROR: $2... failed $N"
    exit 1 # you can give other than 0
else
    echo "$G $2... scucess $N"
fi
}

if [ $ID -ne 0 ]
then
    echo "$R ERROR:pleae run with root access $N "
    exit 1 # you can give other than 0
else
    echo "$G Root user $N"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "instll myql"

yum install git -y &>> $LOGFILE

VALIDATE $? "instll git"