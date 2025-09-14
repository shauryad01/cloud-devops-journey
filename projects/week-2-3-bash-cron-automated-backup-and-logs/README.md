# Bash-Cron Scripting Project — Automated Backups, Log Parsing & Alerts

A lightweight automation suite for **backing up folders**, **parsing logs**, and **sending email alerts** on failure.
Built entirely with **Bash, cron, AWS CLI (SES)**, and standard Linux tools.

---

## **Features**

- Backs up any specified folder into a timestamped `.tar.gz` archive.
- Parses logs (`grep` for errors/warnings) and saves a report.
- Sends **email alerts** via Amazon SES if any step fails.
- Runs automatically with **cron** (`@daily` or custom schedules).
- Uses `.env` to keep sensitive values (email, AWS region) out of code.
- Simple folder structure:

  ```
  /scripting
  ├── backups/   # backup archives
  ├── reports/   # parsed log reports
  └── scripts/   # all bash scripts + .env
  ```

---

## **Requirements**

- Linux (EC2 or local)
- bash, tar, gzip, grep, cron (standard on most distros)
- AWS CLI configured with SES credentials
- Verified SES emails (sandbox mode requires verifying sender and recipient)

---

## **Quick Start**

### Make Scripts Executable

```bash
chmod +x scripts/*.sh
```

### Add Environment Variables (`scripts/.env`)

```dotenv
FROM_EMAIL=your_verified_from@example.com
TO_EMAIL=your_verified_to@example.com
AWS_REGION=us-east-1
```

### Test Manually

```bash
./scripts/orchestrator.sh \
    /home/ubuntu/scripting/scripts \
    /var/log/syslog \
    /home/ubuntu/scripting/backups \
    /home/ubuntu/scripting/reports
```

### Automate with Cron

Edit crontab:

```bash
crontab -e
```

Add:

```bash
@daily /home/ubuntu/scripting/scripts/orchestrator.sh \
/home/ubuntu/scripting/scripts \
/var/log/syslog \
/home/ubuntu/scripting/backups \
/home/ubuntu/scripting/reports >> /home/ubuntu/scripting/cron.log 2>&1
```

---

## 📂 **Scripts Overview**

- `backup.sh` → Compresses a folder into timestamped backups.
- `parse_logs.sh` → Greps errors/warnings and generates a report.
- `orchestrator.sh` → Main controller: calls the above, handles failures, emails alerts.

---

## 📧 **Failure Handling**

- Uses `trap 'send_email' ERR` to catch any command failures.
- Sends email via AWS SES with subject/body identifying the failing script.
- Check `/home/ubuntu/scripting/cron.log` for cron output.

---

## 💡 **What I Learned / What This Project Shows**

- Writing modular Bash scripts with arguments and input validation.
- Using `cron` for scheduling and redirecting output to logs.
- Securely managing secrets using `.env`.
- Configuring **AWS SES** to send programmatic emails.
- Debugging environment differences between interactive shells and cron.
- Building practical DevOps-style automation on an EC2 instance.

---

## 🔗 **Useful Links**

- [AWS SES Documentation](https://docs.aws.amazon.com/ses/latest/dg/Welcome.html)
- [Cron How-To (Ubuntu Wiki)](https://help.ubuntu.com/community/CronHowto)
- [Bash Scripting Guide](https://www.gnu.org/software/bash/manual/bash.html)
- [Video: Bash + Cron Automation Walkthrough](https://youtu.be/9Xl1ZTk3BQw?si=t-MhpYY9ThU1kO8v)
