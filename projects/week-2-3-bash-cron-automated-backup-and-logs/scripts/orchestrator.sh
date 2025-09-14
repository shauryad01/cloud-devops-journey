<<task
This script is used to backup a folder and parse logs
Given arguments $1 = path of folder to backup, $2 = path of log to parse, $3 = Directory to store backup, $4 = Directory to store log parse report
Also send an email in case of failure 
task

#!/bin/bash
set -e

source /home/ubuntu/scripting/scripts/.env

if [ $# -ne 4 ];then
	echo "Invalid inputs. Usage: $0 <path_of_folder_to_backup> <path_of_log_to_parse> <backup_dir> <report_dir>"
	exit 1
fi

FOLDER_TO_BACKUP="$1"
LOG_TO_PARSE="$2"
BACKUP_DIR="$3"
REPORT_DIR="$4"

mkdir -p "$BACKUP_DIR" "$REPORT_DIR"

send_email() {
    SUBJECT="Script Failure: $0"
    BODY="The script $0 failed at $(date). Check logs."

    aws ses send-email \
        --from "$FROM_EMAIL" \
        --destination ToAddresses="$TO_EMAIL" \
        --message "Subject={Data=\"$SUBJECT\"},Body={Text={Data=\"$BODY\"}}" \
        --region "$AWS_REGION"
}

trap 'send_email' ERR 

/home/ubuntu/scripting/scripts/backup.sh $FOLDER_TO_BACKUP $BACKUP_DIR
echo "Backup Successful"
printf "\n"


/home/ubuntu/scripting/scripts/parse_logs.sh $LOG_TO_PARSE $REPORT_DIR
echo "Log Parse Successful"
