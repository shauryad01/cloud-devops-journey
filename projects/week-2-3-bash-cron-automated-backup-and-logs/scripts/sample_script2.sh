#!/bin/bash


read -p "Enter Username: " username

read -p "Enter Password: " pwd

sudo useradd -m $username -p $pwd

echo "New User added"

cat /etc/passwd | grep $username
