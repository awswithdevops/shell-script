#!/bin/bash

ID=$(id -u) # root uer id

echo "script name $0"

VALIDATE(){
    if [ $1 -ne 0 ]
then
    echo "ERROR: $2... failed "
    exit 1 # you can give other than 0
else
    echo "$2... scucess"
fi
}

if [ $ID -ne 0 ]
then
    echo "ERROR:pleae run with root access "
    exit 1 # you can give other than 0
else
    echo "Root user"
fi

yum install mysql -y

VALIDATE $? "instll myql"

yum install git -y

VALIDATE $? "instll git"