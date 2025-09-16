# Cheatsheet: 16 – Logs & Monitoring

---

## Log Directories & Viewing

| Command                       | Description                              | Common Switches / Examples               |
| ----------------------------- | ---------------------------------------- | ---------------------------------------- | --- |
| `ls -l /var/log/`             | List all log files and their permissions | —                                        |
| `du -sh /var/log/\*           | sort -h`                                 | Show log file sizes (sorted)             | —   |
| `less /var/log/syslog`        | View general system messages             | `/ssh` to search inside                  |
| `less /var/log/auth.log`      | View authentication logs                 | —                                        |
| `less /var/log/kern.log`      | View kernel logs                         | —                                        |
| `grep sshd /var/log/auth.log` | Filter logs for SSH entries              | —                                        |
| `tail -f /var/log/syslog`     | Follow a log file in real time           | `less +F /var/log/syslog` as alternative |

---

## Journalctl Basics

| Command                     | Description                               | Common Switches / Examples                |
| --------------------------- | ----------------------------------------- | ----------------------------------------- |
| `journalctl`                | Display all logs from systemd journal     | —                                         |
| `journalctl -xe`            | Show recent errors with details           | —                                         |
| `journalctl -b`             | Logs since current boot                   | `-b -1` for previous boot                 |
| `journalctl -u ssh`         | Filter by specific service                | —                                         |
| `journalctl -p 3 -b`        | Show only error-priority logs             | Priorities: 0–7 (`emerg` → `debug`)       |
| `journalctl -r`             | Reverse order (most recent first)         | —                                         |
| `journalctl -n 10`          | Show last 10 entries                      | —                                         |
| `journalctl --list-boots`   | List boots with IDs and timestamps        | —                                         |
| `journalctl -o json-pretty` | Output in JSON for parsing                | `--utc` to use UTC timestamps             |
| `journalctl --disk-usage`   | Display journal log disk usage            | —                                         |
| `journalctl -f`             | Follow logs in real time (like `tail -f`) | —                                         |
| `journalctl -g "keyword"`   | Search logs for keyword                   | Use `--since` and `--until` to time-bound |

---

## Custom Log Messages

| Command                               | Description                  | Common Switches / Examples |
| ------------------------------------- | ---------------------------- | -------------------------- |
| `logger "HawkEye test log – $(date)"` | Create a custom log entry    | —                          |
| `journalctl \| grep "HawkEye"`        | Verify custom log in journal | —                          |

---

## System Monitoring Tools

| Command               | Description                               | Common Switches / Examples |
| --------------------- | ----------------------------------------- | -------------------------- |
| `uptime`              | Show system uptime and load averages      | —                          |
| `w`                   | Display logged-in users and activity      | —                          |
| `top`                 | Monitor running processes (default)       | `q` to quit                |
| `htop`                | Enhanced process monitor (install first)  | `F6` to sort columns       |
| `vmstat 1 5`          | Show memory, I/O, and CPU stats           | Interval = 1s, Count = 5   |
| `iostat 1 5`          | CPU and I/O statistics (requires sysstat) | —                          |
| `sar -u 1 5`          | CPU usage history (requires sysstat)      | —                          |
| `df -h`               | Disk usage by filesystem (human-readable) | —                          |
| `du -sh * \| sort -h` | Per-directory disk usage sorted by size   | —                          |

---

## Log Rotation

| Command                                                                     | Description                              | Common Switches / Examples |
| --------------------------------------------------------------------------- | ---------------------------------------- | -------------------------- |
| `cat /etc/logrotate.conf`                                                   | View main logrotate configuration        | —                          |
| `ls -l /etc/logrotate.d/`                                                   | List per-service rotation configs        | —                          |
| `less /etc/logrotate.d/syslog`                                              | Inspect a sample rotation config         | —                          |
| `sudo logrotate -d /etc/logrotate.conf`                                     | Dry-run to test rotation without changes | —                          |
| `sudo journalctl --vacuum-size=1G`                                          | Limit journal size to 1 GB               | —                          |
| `sudo journalctl --vacuum-time=2weeks`                                      | Delete logs older than 2 weeks           | —                          |
| `sudo mkdir -p /var/log/journal && sudo systemctl restart systemd-journald` | Enable persistent journal storage        | —                          |

---

## Kernel Messages (dmesg)

| Command                   | Description                                  | Common Switches / Examples |
| ------------------------- | -------------------------------------------- | -------------------------- |
| `dmesg`                   | Show kernel messages from boot and drivers   | —                          |
| `dmesg -c`                | View and clear the kernel ring buffer        | —                          |
| `dmesg -w`                | Follow kernel messages in real time          | —                          |
| `dmesg \| grep -i memory` | Search kernel messages for specific keywords | —                          |

```

```
