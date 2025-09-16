# 16 – Logs & Monitoring

Covered the essentials of Linux logging, monitoring, and log rotation. Learned how to navigate `/var/log/`, use `journalctl` to query the systemd journal, send and follow logs in real time, monitor system health with built-in tools (`top`, `htop`, `vmstat`, `iostat`), and manage disk usage through log rotation. This is the backbone of diagnosing issues and keeping systems healthy.

---

## 📌 What I Did

### Log Directories & Files

- `pwd` # confirm working directory
- `ls -l /var/log/` # list logs
- `du -sh /var/log/* | sort -h` # check log sizes
- `less /var/log/syslog` # system messages
- `less /var/log/auth.log` # authentication logs
- `less /var/log/kern.log` # kernel logs
- `grep sshd /var/log/auth.log` # filter auth log entries
- Searched within less using `/ssh`

### Journalctl Basics

- `journalctl` # view all logs
- `journalctl -xe` # recent errors
- `journalctl -b` # logs since current boot
- `journalctl -b -1` # previous boot logs
- `journalctl -u ssh` # filter by service
- `journalctl -p 3 -b` # errors only
- `journalctl -k` # kernel-only logs
- `journalctl -r` # reverse order
- `journalctl -n 5` # last 5 entries
- `journalctl --list-boots` # list boots
- Filtered with grep: `journalctl | grep HawkEye`
- Customized output:
  - `journalctl -o short`
  - `journalctl -o json-pretty`
  - `journalctl --utc`
  - `journalctl --disk-usage`

### Send & Verify Custom Logs

- `logger "HawkEye test log – $(date)"`
- `journalctl | grep "HawkEye"`

### Real-Time Following

- `tail -f /var/log/syslog`
- `less +F /var/log/syslog`
- `journalctl -f`

### System Monitoring Commands

- `uptime` # load averages
- `w` # logged-in users
- `top` # default monitor
- `htop` # nicer monitor
- `vmstat 1 5`
- `iostat 1 5`
- `sar -u 1 5`
- `df -h` # disk usage
- `du -sh * | sort -h`

### Log Rotation

- `cat /etc/logrotate.conf`
- `ls -l /etc/logrotate.d/`
- `less /etc/logrotate.d/syslog`
- `sudo logrotate -d /etc/logrotate.conf` # dry-run
- Set journalctl limits:
  - `sudo journalctl --vacuum-size=1G` # cap size
  - `sudo journalctl --vacuum-time=2weeks` # cap age
- Enable persistent storage:
  - `sudo mkdir -p /var/log/journal && sudo systemctl restart systemd-journald`

### Kernel Messages with dmesg

- `dmesg` # view kernel messages
- `dmesg -c` # view and clear
- `dmesg -w` # follow in real time
- `dmesg | grep -i memory` # filter

---

## 📝 Why This Matters

- **Root cause analysis** starts with logs—knowing `/var/log/` and `journalctl` saves hours.
- **Real-time monitoring** (`tail -f`, `journalctl -f`, `htop`) is essential when debugging live systems.
- **Log rotation** prevents disks from filling up and crashing services.
- **dmesg** is a hardware and kernel lifeline for device or driver issues.
- **DevOps and SRE** roles depend on reading, filtering, and maintaining logs quickly under pressure.

---

## 🔗 Useful Links

- [GeeksforGeeks – How to Use journalctl](https://www.geeksforgeeks.org/linux-unix/how-to-use-journalctl-to-view-and-manipulate-systemd-logs/)
- [GeeksforGeeks – Reading & Editing systemd Logs](https://www.geeksforgeeks.org/linux-unix/how-to-read-and-edit-systemd-logs-using-journalctl-in-linux/)
- [GeeksforGeeks – dmesg Command](https://www.geeksforgeeks.org/linux-unix/how-to-use-the-dmesg-command-on-linux/)
- [Ubuntu Manpage – logrotate](http://manpages.ubuntu.com/manpages/focal/en/man8/logrotate.8.html)
