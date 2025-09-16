# Linux-CLI

This is where I finally got serious about the Linux command line.
I’d dabbled before—copy-pasting commands from tutorials—but never _understood_ what was happening.

These folders document me experimenting, breaking things, fixing them, and connecting the dots.
Each subfolder focuses on a specific skill area. It’s not a polished course—it’s **real commands, real notes, and real screenshots** from actual practice.

---

## 🗂️ What’s in here

- **`01-setting-up-ec2/`** – Launched and SSH’d into an EC2 instance, configured keys, and explored basic system info (`whoami`, `uname`, `top`).
- **`02-rtfm-man-tldr-help/`** – Learned to self-help with `man`, `--help`, and `tldr`.
- **`03-navigating-file-structure-and-superuser/`** – Navigated the filesystem, learned directory structure, and practiced safe `sudo` usage.
- **`04-package-management/`** – Installed/removed software with `apt`, `yum`, `dnf`. Fixed repos and dependencies.
- **`05-vim-editing/`** – Practiced Vim basics: modes, saving, quitting, search/replace.
- **`06-shell-basics/`** – Worked with environment variables, `$PATH`, history, and simple shell customizations.
- **`07-text-processing/`** – Manipulated text using `cat`, `less`, `head`, `tail`, `cut`, `sort`, `uniq`, `wc`, `tr`, `awk`.
- **`08-file-and-directory-operations/`** – Created, moved, copied, and deleted files/dirs. Explored hard/soft links, metadata (`stat`, `du`, `df`).
- **`09-permissions-and-ownership/`** – Mastered permissions (`chmod`), ownership (`chown`), SUID/SGID/sticky bits, and `umask`.
- **`10-user-management/`** – Managed users, groups, sudo privileges, login shells, password policies (`chage`), and explored `/etc/passwd`, `/etc/shadow`, `/etc/skel`.
- **`11-process-management/`** – Learned PID, PPID, job control (`bg`, `fg`, `nohup`), signals, priorities (`nice`, `renice`), daemons, and advanced tools (`strace`, `pmap`, `lsof`, `time`). Covered forked/zombie processes.
- **`12-service-management/`** – Used `systemctl` and `systemd`. Started/stopped services, enabled/disabled at boot, and created a custom systemd unit file for a Python app.
- **`13-server-info-disk-management/`** – Gathered hardware info (`lscpu`, `lsusb`, `lspci`), disk/memory stats (`free`, `lsblk`, `df`, `du`), worked with `fdisk`, `mkfs`, `mount`, UUIDs, LVM, and swap.
- **`14-networking-basics/`** – Practiced `ping`, `curl`, `wget`, `ss`, `netstat`, and `ip` to check connections, routes, and interfaces.
- **`15-ssh-remote-management/`** – Configured SSH, key-based authentication, port forwarding, aliases, and multiplexing for efficient remote access.
- **`16-logs-monitoring/`** – Explored `/var/log/`, rotated logs, tailed live logs, filtered with `grep`, and used `journalctl` for systemd logs and monitoring.
- **`17-security-basics/`** – Inspected open ports (`ss`, `lsof`, `nmap`), managed firewalls with **ufw**, **firewalld**, and **iptables**, tested rules with `nc`, and applied least-privilege firewall practices.

---

## 📄 Cheatsheets

- [01 — Setting up EC2](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/01-setting-up-ec2/cheatsheet.md)
- [02 — RTFM, MAN, TLDR, HELP](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/02-rtfm-man-tldr-help/cheatsheet.md)
- [03 — Navigating File Structure & Superuser](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/03-navigating-file-structure-and-superuser/cheatsheet.md)
- [04 — Package Management](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/04-package-management/cheatsheet.md)
- [05 — Vim Editing](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/05-vim-editing/cheatsheet.md)
- [06 — Shell Basics](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/06-shell-basics/cheatsheet.md)
- [07 — Text Processing](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/07-text-processing/cheatsheet.md)
- [08 — File & Directory Operations](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/08-file-and-directory-operations/cheatsheet.md)
- [09 — Permissions & Ownership](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/09-permissions-and-ownership/cheatsheet.md)
- [10 — User Management](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/10-user-management/cheatsheet.md)
- [11 — Process Management](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/11-process-management/cheatsheet.md)
- [12 — Service Management](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/12-service-management/cheatsheet.md)
- [13 — Server Info & Disk Management](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/13-server-info-disk-management/cheatsheet.md)
- [14 — Networking Basics](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/14-networking-basics/cheatsheet.md)
- [15 — SSH & Remote Management](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/15-ssh-remote-management/cheatsheet.md)
- [16 — Logs & Monitoring](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/16-logs-monitoring/cheatsheet.md)
- [17 — Security Basics (Firewall & Ports)](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/17-security-basics/cheatsheet.md)

---

## 📚 Resources I Used

- **[Linux Journey](https://linuxjourney.com/)** – Beginner-friendly explanations.
- **[TrainWithShubham Linux Playlist](https://youtube.com/playlist?list=PLlfy9GnSVerQr-Se9JRE_tZJk3OUoHCkh)** – Full Linux series for DevOps.
- **[TrainWithShubham Linux One-Shot](https://youtu.be/e01GGTKmtpc)** – Concise practical overview.
- **[Linux Upskill Challenge](https://linuxupskillchallenge.org/)** – 21-day hands-on learning.
- **[The Linux Documentation Project](https://tldp.org/)** – Still-useful references.
- **[Ubuntu Manpages](https://manpages.ubuntu.com/)** – Command-specific help.
- Built-in help: `man`, `--help`, `tldr`.

---

## ❓ Why This Exists

I didn’t want to be the person who panics when the GUI isn’t available.
Learning Linux CLI is a core skill for DevOps, and for any engineer. The only way to learn it is to **use it**—so that’s what I did.

This folder keeps growing as I tackle advanced topics: logs, security, troubleshooting, and beyond.
Each directory = one **hands-on learning block**.

---

## 🤝 Follow Along

- **GitHub:** [@shauryad01](https://github.com/shauryad01)
- **LinkedIn:** [Shaurya Dhingra](https://www.linkedin.com/in/shauryadhingra/)
- **Docs/Blog:** [Hashnode](https://shauryad01.hashnode.dev/)

---
