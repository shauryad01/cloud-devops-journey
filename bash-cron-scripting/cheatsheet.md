# Cheatsheet: Bash & Cron Scripting

---

## **Bash Scripting Basics**

| Command / Concept        | Description                                        | Example                                                       |
| ------------------------ | -------------------------------------------------- | ------------------------------------------------------------- |
| `#!/bin/bash`            | Shebang: tells the system to use Bash to interpret | `#!/bin/bash` at the top of your script                       |
| `chmod +x script.sh`     | Make a script executable                           | `chmod +x backup.sh`                                          |
| `./script.sh arg1 arg2`  | Run a script with arguments                        | `./backup.sh /home/user docs_backup`                          |
| `$#` / `$@` / `$?`       | Arg count / all args / previous exit code          | `if [ $# -ne 2 ]; then echo "Usage: $0 src dest"; exit 1; fi` |
| `set -e`                 | Exit immediately if a command fails                | Place near the top of scripts                                 |
| Functions                | Group reusable logic                               | `my_func() { echo "Hello $1"; }`                              |
| `tar -czf`               | Create compressed backups                          | `tar -czf backup_$(date +%F).tar.gz /path/to/dir`             |
| `grep`, `awk`, `cut`     | Parse and filter logs                              | `grep -i "error" /var/log/syslog`                             |
| `ps`, `pgrep`, `top`     | Monitor processes                                  | `pgrep nginx`                                                 |
| Redirection (`>`, `>>`)  | Redirect output (overwrite or append)              | `./script.sh >> /var/log/myscript.log 2>&1`                   |
| `find -mtime +7 -delete` | Find and delete files older than 7 days            | `find /backups -type f -mtime +7 -delete`                     |

---

## **Cron Job Basics**

| Command / Concept       | Description                        | Example                                                                   |
| ----------------------- | ---------------------------------- | ------------------------------------------------------------------------- |
| `crontab -e`            | Edit user’s crontab file           | —                                                                         |
| `crontab -l`            | List current cron jobs             | —                                                                         |
| `systemctl status cron` | Check if cron service is running   | `sudo systemctl status cron`                                              |
| `@reboot`               | Run at startup                     | `@reboot /home/ubuntu/scripts/startup.sh >> /home/ubuntu/reports/log.txt` |
| `@daily`                | Run once a day                     | `@daily /home/ubuntu/scripts/orchestrator.sh`                             |
| `* * * * *` format      | Schedule: min hr day month weekday | `0 2 * * * backup.sh /home/user backups` (every day at 2 AM)              |
| Redirect cron output    | Capture logs for debugging         | `@hourly ./parse_logs.sh >> /var/log/parse.log 2>&1`                      |

---

## **Cron Environment Gotchas**

| Issue                 | Description/Tip                                                 |
| --------------------- | --------------------------------------------------------------- |
| PATH differences      | Cron uses a minimal PATH. Use full paths (e.g. `/usr/bin/tar`). |
| Test scripts manually | Always run your script interactively before scheduling.         |
| Use absolute paths    | Cron runs from `/`. Use full paths for scripts/files.           |

---

## **Useful Patterns**

| Task                    | Command/Example                                                                                                             |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| Backup daily            | `@daily /home/ubuntu/scripts/backup.sh /home/ubuntu/data /home/ubuntu/backups`                                              |
| Parse logs hourly       | `@hourly /home/ubuntu/scripts/parse_logs.sh /var/log/syslog /home/ubuntu/reports`                                           |
| Cleanup old backups     | `@weekly find /home/ubuntu/backups -type f -mtime +7 -delete`                                                               |
| Email on failure (mail) | `@daily /home/ubuntu/scripts/orchestrator.sh \|\| echo "Backup failed on $(date)" \| mail -s "Cron Failed" you@example.com` |
