#!/bin/bash

<< comment
This is a script to check voting age
comment

read -p "Enter Age: " age

if [ $age -ge 18 ];
then
	echo "Can Vote"
else
	echo "Cannot Vote"
fi
