#!/bin/bash

create_dir(){
	mkdir demo
}
if ! create_dir;
then

	echo "Dir already exists"
	exit 1
fi
echo "This should not work as code is interrupted"
