#!/bin/bash

ID=$(id -u) # root uer id

if [ $ID -ne 0 ]
then
    echo "ERROR:pleae run with root access "
else
    echo "Root user"
fi
