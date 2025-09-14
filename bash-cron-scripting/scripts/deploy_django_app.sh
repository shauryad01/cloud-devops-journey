#!/bin/bash

<< task
Deplo Django app + Handle errors
task

code_clone(){
	echo "Cloning Django App..."
	git clone https://github.com/LondheShubham153/django-notes-app.git
	cd django-notes-app
}

install_req(){
	echo "Installing dependencies..."
	sudo apt-get update && sudo apt-get install -y docker.io nginx docker-compose
}

reqd_restarts(){
	sudo chown $USER /var/run/docker.sock
	sudo systemctl enable docker
	sudo systemctl enable nginx	
	sudo systemctl restart docker
}

deploy(){
	cd ~/scripting/django-notes-app
	docker build -t notes-app .
	docker run -d --name notes-app -p 8000:8000 notes-app:latest
}

echo "DEPLOYMENT STARTED"
if ! code_clone; then 
	echo "Code dir already exists"
	cd django-notes-app
fi

if ! install_req; then
	echo "Installation Failed"
	exit 1
fi

if ! reqd_restarts; then 
	echo "System fault identified"
	exit 1
fi

deploy

echo "DEPLOYMENT COMPLETE"
