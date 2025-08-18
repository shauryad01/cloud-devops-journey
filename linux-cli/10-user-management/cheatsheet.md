# Cheatsheet: 10 – User Management

---

## User Information

| Command                | Description                      | Common Switches / Examples         |
| ---------------------- | -------------------------------- | ---------------------------------- |
| `whoami`               | Show current username            | —                                  |
| `id <user>`            | Display UID, GID, and groups     | `id alice`                         |
| `groups <user>`        | Show groups for a user           | `groups alice`                     |
| `who` / `w`            | Show logged-in users             | —                                  |
| `cat /etc/passwd`      | List all system users            | `awk -F: '{print $1}' /etc/passwd` |
| `cat /etc/group`       | List all groups                  | —                                  |
| `sudo cat /etc/shadow` | View password hashes (root only) | —                                  |

---

## User Creation

| Command                                | Description                                | Common Switches / Examples |
| -------------------------------------- | ------------------------------------------ | -------------------------- |
| `sudo useradd -m alice`                | Add user with home directory               | —                          |
| `sudo passwd alice`                    | Set password for user                      | —                          |
| `sudo useradd -m -s /bin/bash bob`     | Create user with specific shell            | —                          |
| `sudo useradd -m -c "Bob Marley" bob2` | Add user with comment (full name)          | —                          |
| `sudo useradd -s /sbin/nologin guest`  | Create user with disabled login (no shell) | —                          |

---

## Modifying Users

| Command                                | Description                     | Common Switches / Examples  |
| -------------------------------------- | ------------------------------- | --------------------------- |
| `sudo usermod -l newname oldname`      | Change login name               | `usermod -l alice2 alice`   |
| `sudo usermod -d /home/newdir -m user` | Change/move user home directory | —                           |
| `sudo passwd -l user`                  | Lock user account               | —                           |
| `sudo passwd -u user`                  | Unlock user account             | —                           |
| `sudo usermod -e YYYY-MM-DD user`      | Set account expiration date     | `usermod -e 2025-09-30 bob` |
| `sudo usermod -u 2001 user`            | Change UID                      | —                           |
| `sudo usermod -g 1005 user`            | Change primary GID              | —                           |
| `sudo usermod -aG group user`          | Add user to supplementary group | —                           |

---

## Deleting Users

| Command                | Description                     | Common Switches / Examples |
| ---------------------- | ------------------------------- | -------------------------- |
| `sudo userdel user`    | Delete user only                | —                          |
| `sudo userdel -r user` | Delete user and remove home dir | —                          |

---

## Group Management

| Command                     | Description            | Common Switches / Examples |
| --------------------------- | ---------------------- | -------------------------- |
| `sudo groupadd devs`        | Create a new group     | —                          |
| `sudo usermod -aG devs bob` | Add user to group      | —                          |
| `groups bob`                | Show groups for a user | —                          |
| `sudo groupdel devs`        | Delete group           | —                          |

---

## Switching Users

| Command                | Description                      | Common Switches / Examples |
| ---------------------- | -------------------------------- | -------------------------- |
| `su - user`            | Switch to another user’s account | `su - alice`               |
| `sudo -u user command` | Run command as another user      | `sudo -u bob whoami`       |

---

## Default Settings

| Command / File             | Description                             | Common Switches / Examples |
| -------------------------- | --------------------------------------- | -------------------------- |
| `ls -la /etc/skel`         | Default files copied to new user homes  | —                          |
| `cat /etc/default/useradd` | View default shell, home base dir, etc. | —                          |

---

## Password & Authentication

| Command                         | Description                    | Common Switches / Examples |
| ------------------------------- | ------------------------------ | -------------------------- |
| `sudo chage -l user`            | Show password aging policy     | —                          |
| `sudo chage -M 30 user`         | Set password expiry to 30 days | —                          |
| `sudo chage -E YYYY-MM-DD user` | Set account expiry date        | —                          |
| `cat /etc/login.defs`           | View system-wide defaults      | —                          |

---

## Sudo Access

| Command                      | Description                    | Common Switches / Examples |
| ---------------------------- | ------------------------------ | -------------------------- |
| `sudo usermod -aG sudo user` | Grant sudo privileges          | —                          |
| `su - user && sudo whoami`   | Test sudo (should return root) | —                          |
| `sudo visudo`                | Safely edit sudoers file       | —                          |

---

## Config Files & Logs

| Path / Command      | Purpose                                   |
| ------------------- | ----------------------------------------- |
| `/etc/passwd`       | Basic user info (username, UID, shell)    |
| `/etc/shadow`       | Encrypted passwords, password expiry info |
| `/etc/group`        | Group definitions                         |
| `/etc/gshadow`      | Secure group info (admins, members)       |
| `/etc/sudoers`      | Controls sudo permissions                 |
| `/etc/skel/`        | Default home files for new users          |
| `/var/log/auth.log` | Authentication & sudo logs                |
| `sudo vipw`         | Safely edit `/etc/passwd`                 |
| `sudo vigr`         | Safely edit `/etc/group`                  |

---

## Common Issues & Fixes

| Issue                     | Fix Command / Action                     |
| ------------------------- | ---------------------------------------- |
| Forgotten password        | `sudo passwd <user>`                     |
| Account locked            | `sudo usermod -U <user>`                 |
| Misconfigured sudo access | `sudo visudo`                            |
| Wrong group memberships   | `sudo usermod -aG group user`            |
| Corrupt passwd/group file | `sudo vipw`, `sudo vigr`                 |
| Apply security updates    | `sudo apt update && sudo apt upgrade -y` |

---
