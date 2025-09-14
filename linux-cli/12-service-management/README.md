# 12 - Service Management (systemd)

Covered the fundamentals of managing system services in Linux using **`systemctl`** (the CLI tool) and explored how **`systemd`** itself works under the hood. Learned to start, stop, enable, disable, and configure services, as well as create custom ones. This is the backbone of how modern Linux boots, runs background daemons, and keeps processes alive.

---

## 📌 What I Did

1.  **Learned the syntax of `systemctl`**

    - General form:

      `systemctl [command] [service]`

      where **command** = (`start`, `stop`, `enable`, `disable`, etc.) and **service** = (`sshd`, `nginx`, `httpd`, etc.).

2.  **Started & stopped services**

    - `systemctl start sshd` — start SSH service.
    - `systemctl stop sshd` — stop SSH service.

3.  **Enabled & disabled services (at boot)**

    - `systemctl enable firewalld` — enable firewall service on startup.
    - `systemctl disable firewalld` — prevent firewall from starting on boot.

4.  **Checked service status**

    - `systemctl status firewalld` — detailed info on service state.
    - `systemctl list-units --type=service` — show all active services.
    - `systemctl --failed` — list failed services.

5.  **Restarted & reloaded services**

    - `systemctl restart sshd` — restart SSH service.
    - `systemctl reload httpd` — reload Apache without stopping it.

6.  **Masked & unmasked services**

    - `systemctl mask mysqld` — prevent MySQL from being started at all.
    - `systemctl unmask mysqld` — allow MySQL to start again.

7.  **Changed default boot targets**

    - `systemctl set-default graphical.target` — boot into GUI.
    - `systemctl set-default multi-user.target` — boot into CLI (server mode).

8.  **Listed unit files**

    - `systemctl list-unit-files` — list all service unit files (enabled/disabled/etc.).

9.  **Created a custom service**

    - Wrote a unit file at `/etc/systemd/system/app.service`:

          [Unit]  Description=My Custom App
          After=network.target

          [Service]
          ExecStart=/usr/bin/python3 /home/ubuntu/app.py
          Restart=always
          User=ubuntu

          [Install]
          WantedBy=multi-user.target

- Reloaded daemon: `sudo systemctl daemon-reload`
- Started service: `sudo systemctl start app`
- Enabled at boot: `sudo systemctl enable app`
- Verified with `systemctl status app`.

10. **Explored `systemd` concepts**

    - Understood difference between **systemd** (the init system, PID 1, manages services) and **systemctl** (the command-line client).

    - Learned about **units** (services, sockets, targets), how dependencies are handled, and why systemd boots faster than old SysVinit.

---

## 📝 Why This Matters

- Modern Linux systems all use **systemd**, so knowing how to control services is non-negotiable.
- As a DevOps engineer, you’ll constantly deal with services like **nginx**, **sshd**, **docker**, **kubelet**, etc. — all managed via `systemctl`.
- Creating custom services is key for deploying apps and ensuring they auto-start, recover on failure, and integrate into the system lifecycle.
- Understanding `systemd` concepts like units, targets, and dependency handling makes troubleshooting and automation far easier.

---

## 🔗 Useful Links

- [GeeksforGeeks — Linux systemd and its components](https://www.geeksforgeeks.org/linux-unix/linux-systemd-and-its-components/)
- [ArchWiki — systemd](https://wiki.archlinux.org/title/Systemd)
- Ubuntu Manpages — systemctl
