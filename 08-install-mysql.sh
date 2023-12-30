#!/bin/bash

ID=$(id -u) # root uer id

if [ $ID -ne 0 ]
then
    echo "ERROR:pleae run with root access "
    exit 1 # you can give other than 0
else
    echo "Root user"
fi

yum install mysql -y

if [ $? -ne 0 ]
then
    echo "ERROR: insatll mysql is failed "
    exit 1 # you can give other than 0
else
    echo "insatll mysql is scucess"
fi