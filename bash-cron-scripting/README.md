# Bash + Cron Scripting

Explored Bash scripting fundamentals, cron scheduling, and built an automated backup and log analysis pipeline.

---

## 📌 What I Did

### Wrote and Ran Bash Scripts

- **hello.sh** → Printed “Hello World” to verify shell setup.
- Used `chmod +x script.sh` and ran with `./script.sh`.
- Practiced:
  - Variables, conditionals (`if`, `case`), and loops (`for`, `while`)
  - Arguments (`$1`, `$#`) and exit codes (`$?`)
  - Functions inside scripts (e.g., `create_backup()` in `backup.sh`)
  - Error handling with `set -e`

### Created Practical Scripts

- **backup.sh** → Took `<source_dir>` and `<backup_dir>` as args, created timestamped `.tar.gz` backups.
- **parse_logs.sh** → Took a log path, searched for `error`/`warn`, saved a timestamped report.
- **orchestrator.sh** → Ran both scripts with absolute paths, ensuring it works regardless of working directory.
- **django_deploy.sh** → Fully deployed a Django app leveraging bash and cron automation.

### Launched AWS Instance

- Created an IAM user with least privilege
- Launched and managed an AWS instance programmatically using bash scripts

### Organized Project Structure

```
~/scripting/
├── backups/    # Timestamped backups
├── reports/    # Log analysis reports
├── scripts/    # All executable scripts
│   ├── backup.sh
│   ├── parse_logs.sh
│   ├── orchestrator.sh
│   ├── django_deploy.sh
│   ├── hello.sh
│   └── (extras: create_user.sh, launch_aws_instance.sh, etc.)
```

### Scheduled Automation with Cron

- Verified current jobs: `crontab -l`
- Edited jobs: `crontab -e`
- Added cron job:
  ```
  @daily /home/ubuntu/scripting/scripts/orchestrator.sh >> /home/ubuntu/scripting/orchestrator.log 2>&1
  ```
- Practiced special strings: `@reboot`, `@hourly`
- Redirected output to logs: `>> /var/log/myscript.log 2>&1`
- Verified execution:
  - Checked `/var/log/syslog` and `orchestrator.log`
  - Confirmed backups and reports after cron ran

### Managed Remote Files

- Used `scp` to transfer backups between EC2 and local machine:
  - **EC2 → Local:**
    ```
    scp -i aws-key.pem ubuntu@<EC2-IP>:/home/ubuntu/scripting/backups/backup-2025-09-03.tar.gz .
    ```
  - **Local → EC2:**
    ```
    scp -i aws-key.pem file.txt ubuntu@<EC2-IP>:/home/ubuntu/scripting/
    ```

### Enhanced Reliability

- Planned backup cleanup of files older than 7 days:
  ```
  find <backup_dir> -mtime +7 -delete
  ```
- Added failure notifications using `mail` or Slack webhook (future work).

---

## 📝 Why This Matters

- **Automation:** Removes manual tasks for backups and monitoring.
- **Error Awareness:** Log parsing to catch issues proactively.
- **Cron Mastery:** Scheduling, output redirection, and verification skills.
- **Real-World Practice:** Simulates DevOps workflows—backups, monitoring, remote management, Django deployment, and AWS automation.

---

## 🔗 Useful Links

- [Linux Filesystem Hierarchy Standard (FHS)](https://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html)
- [GNU Coreutils Manual](https://www.gnu.org/software/coreutils/manual/coreutils.html)
- [Sudo Manual](https://www.sudo.ws/man/1.8.27/sudo.man.html)
- [Shell Scripting | TrainWithShubham (YouTube)](https://youtu.be/9Xl1ZTk3BQw?si=t-MhpYY9ThU1kO8v)
