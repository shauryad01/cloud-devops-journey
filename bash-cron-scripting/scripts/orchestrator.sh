#!/bin/bash
set -e

mkdir -p /home/ubuntu/scripting/backups
mkdir -p /home/ubuntu/scripting/reports


/home/ubuntu/scripting/scripts/backup.sh /home/ubuntu/scripting/scripts/ /home/ubuntu/scripting/backups

echo ""
echo ""

/home/ubuntu/scripting/scripts/parse_logs.sh /var/log/syslog /home/ubuntu/scripting/reports/



