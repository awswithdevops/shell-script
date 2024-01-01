#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
echo "Script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 error:...$R Faield $N"
    else
        echo -e "$2 .....$G Sucess $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:pleae run with root access $N "
    exit 1 # you can give other than 0
else
    echo -e "$G Root user $N"
fi

#echo "All arguments passed: $@"
# git mysql postfix
# package= git for firt time  

for package in $@
do
    yum installing $package -y  &>> $LOGFILE
    if [ $? -ne 0 ]
    then
        yum install $package-y  &>> $LOGFILE
        VALIDATE $? "intsallation of $package"
    else
        echo -e "$package is already installed...$Y Skipping..$N"
    fi

done