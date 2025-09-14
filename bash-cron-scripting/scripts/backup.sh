<<task
Backup any folder as .tar.gz
task


#!/bin/bash
set -e

if [ $# -ne 2 ]; then 
	echo "Provide folder name as argument. Usage: $0 <folder_to_backup> <backup_name>"
	exit 1
fi

SRC_DIR=$1
BKP_DIR=$2
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
FILENAME=backup_$(basename $SRC_DIR)_$TIMESTAMP.tar.gz

create_backup(){
	tar -czf "$BKP_DIR/$FILENAME" -C "$(dirname $SRC_DIR)" "$(basename $SRC_DIR)"
}

if [ ! -d $BKP_DIR ]; then
	mkdir -p $BKP_DIR
	echo "Created Backup Directory"
fi

create_backup

if [ -f "$BKP_DIR/$FILENAME" ]; then
    echo "Backup successful: $BKP_DIR/$FILENAME"
    exit 0
else
    echo "Backup failed."
    exit 2
fi


