# Linux-CLI

This folder is where I started building real comfort with the Linux command line.  
I’d used Linux casually before — running the occasional command or following install instructions — but never dug into the fundamentals properly.

These experiments were my way of doing that: opening a terminal, typing commands I barely knew, breaking things, fixing them, and slowly understanding how Linux actually works.

Each subfolder focuses on one skill area. There’s no copy-paste cheat sheet or polished tutorial — just the commands I ran, notes I took, and screenshots of real usage.

----------

## 🗂️ What’s in here

-   **`01-setting-up-ec2/`**  
    Launched and connected to an **EC2 instance**, configured **SSH keys**, and explored **basic system info** (`whoami`, `uname`, `top`, etc.) to get familiar with the environment.
    
-   **`02-rtfm-man-tldr-help/`**  
    Mastered the built-in **help tools**: `man`, `--help`, and `tldr`. Learned to **troubleshoot** and explore commands without relying on Google.
    
-   **`03-navigating-file-structure-and-superuser/`**  
    Moved around the **file system**, understood **Linux directory structure**, and practiced using **`sudo`** responsibly.
    
-   **`04-package-management/`**  
    Installed, updated, and removed **software** with **package managers** (`apt`, `yum`, `dnf`). Added/removed **repositories** and fixed **dependency errors**.
    
-   **`05-vim-editing/`**  
    Practiced using **Vim editor**: insert/normal modes, saving, quitting, searching, replacing, and basic navigation.
    
-   **`06-shell-basics/`**  
    Learned about **environment variables**, **PATH**, command history, and simple shell customizations.
    
-   **`07-text-processing/`**  
    Worked with `cat`, `less`, `head`, `tail`, `cut`, `sort`, `uniq`, `wc`, `tr`, and `awk` to manipulate and process text files.
    
-   **`08-file-and-directory-operations/`**  
    Hands-on with creating, moving, copying, deleting files & directories. Also worked with **links (`ln`, `ln -s`)** and file metadata (`stat`, `du`, `df`).
    
-   **`09-permissions-and-ownership/`**  
    Managed file **permissions** with `chmod`, **ownership** with `chown`, special modes (**SUID, SGID, sticky bit**), and default masks via **`umask`**.
    
-   **`10-user-management/`**  
    Created, modified, locked, and deleted users. Managed **groups**, **sudo privileges**, **login shells**, **password policies (`chage`)**, and explored **/etc/passwd**, **/etc/shadow**, **/etc/skel**.
    
- **`11-process-management/`**  
  Learned **process fundamentals** (PID, PPID, UID, TTY, states), **foreground/background jobs**, **job control** (`bg`, `fg`, `disown`, `nohup`), **signals**, **priorities** (`nice`, `renice`), **daemons/services**, and **advanced tools** (`strace`, `pmap`, `lsof`, `time`). Also covered **fork**, **child processes**, and handling **zombie/orphan processes**.

    

----------

## 📄 Cheatsheets

-   [01 — Setting up EC2](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/01-setting-up-ec2/cheatsheet.md)
    
-   [02 — RTFM, MAN, TLDR, HELP](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/02-rtfm-man-tldr-help/cheatsheet.md)
    
-   [03 — Navigating File Structure & Superuser](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/03-navigating-file-structure-and-superuser/cheatsheet.md)
    
-   [04 — Package Management](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/04-package-management/cheatsheet.md)
    
-   [05 — Vim Editing](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/05-vim-editing/cheatsheet.md)
    
-   [06 — Shell Basics](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/06-shell-basics/cheatsheet.md)
    
-   [07 — Text Processing](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/07-text-processing/cheatsheet.md)
    
-   [08 — File & Directory Operations](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/08-file-and-directory-operations/cheatsheet.md)
    
-   [09 — Permissions & Ownership](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/09-permissions-and-ownership/cheatsheet.md)
    
-   [10 — User Management](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/10-user-management/cheatsheet.md)
    
-   [11 — Process Management](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/11-process-management/cheatsheet.md)
    

----------

## 📚 Resources I Used

If you’re starting with Linux CLI, these helped me a lot:

-   **[Linux Journey](https://linuxjourney.com/)** — Great beginner-friendly explanations.
    
-   **[TrainWithShubham Linux Playlist](https://youtube.com/playlist?list=PLlfy9GnSVerQr-Se9JRE_tZJk3OUoHCkh&si=leYXfZmXWX32phR9)** — Full Linux training series for DevOps learners.
    
-   **[TrainWithShubham Linux One-Shot](https://youtu.be/e01GGTKmtpc?si=s4ChOBpA_TwuHsnm)** — Concise, practical overview.
    
-   **[Linux Upskill Challenge](https://linuxupskillchallenge.org/)** — 21-day hands-on learning path.
    
-   **[The Linux Documentation Project](https://tldp.org/)** — Old but still useful references.
    
-   **[Ubuntu Manpages](https://manpages.ubuntu.com/)** — For command-specific help.
    
-   Built-in help tools: **`man`**, **`--help`**, **`tldr`**.
    

----------

## ❓ Why This Exists

I didn’t want to be the person who panics when the GUI isn’t available.  
Learning Linux CLI is a core skill for DevOps, and for an engineer in general. The only way to actually learn it is to _use_ it — so that’s what I did here.

This folder is steadily growing as I cover advanced topics (processes, networking, services, security).  
Each directory = one **hands-on learning block**.

----------

## 🔜 Next Steps

-   **Disk & System Info** (`lsblk`, `df`, `du`, `free`, `uptime`)
    
-   **Networking Basics** (`ping`, `curl`, `wget`, `ss`, `netstat`)
    
-   **Service Management** (`systemctl`, `services`, `systemd basics`)
    
-   **Logs & Monitoring** (`journalctl`, `/var/log/`)
    
-   **Security Basics** (firewall, ports, fail2ban)
    
-   Eventually: **Shell scripting** for automation
    

----------

## 🤝 Follow Along

-   **GitHub:** [@shauryad01](https://github.com/shauryad01)
    
-   **LinkedIn:** [Shaurya Dhingra](https://www.linkedin.com/in/shauryadhingra/)
    
-   **Docs/Blog:** [Hashnode](https://shauryad01.hashnode.dev/)
    
