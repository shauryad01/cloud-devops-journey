<<task
Parse logs
task

#!/bin/bash
set -e

if [ $# -ne 2 ]; then
	echo "Invalid Input. Usage: $0 <log_path> <report_destination>"
	exit 1
fi

log_path=$1
REPORT=$2/"log_report_$(basename "$log_path")_$(date +"%Y-%m-%d_%H-%M-%S").txt"

echo "Log Analysis Report: $1" >> $REPORT
echo "Generated on: $(date)" >> $REPORT
echo "" >> $REPORT

echo "ERRORS REPORTED:" >> $REPORT
grep -i "error" "$log_path" | cut -c1-200 >> $REPORT  || echo "No errors found" >> $REPORT

echo "" >> $REPORT
echo "" >> $REPORT
echo "WARNING REPORTED:" >> $REPORT
grep -i "warn" "$log_path" | cut -c1-200 >> $REPORT || echo "No warnings found" >> $REPORT

cat $REPORT
echo "Report saved at $REPORT"
