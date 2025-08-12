# 03-navigating-file-structure-and-superuser

Explored the **Linux filesystem hierarchy**, navigation commands, and how to use superuser privileges responsibly.

---

## 📌 What I Did

1. **Navigated the Filesystem**  
   ```bash
   pwd
   cd /home
   cd ..
   cd ~
   ```
   - `pwd` → Show current directory path.  
   - `cd` → Change directories (`..` for parent, `~` for home).  
   - Purpose: Get comfortable moving through Linux directories.

2. **Listed Directory Contents**  
   ```bash
   ls
   ls -l
   ls -a
   ls -lh
   ```
   - Purpose: View files with details (`-l`), hidden files (`-a`), and human-readable sizes (`-h`).

3. **Viewed Files and Structure**  
   ```bash
   tree
   cat /etc/os-release
   less /var/log/syslog
   head -n 10 file.txt
   tail -f /var/log/syslog
   ```
   - Purpose: Understand the directory tree and quickly inspect files/logs.

4. **Understood Linux Directory Structure**  
   Explored key directories:
   - `/` — Root directory.
   - `/home` — User home directories.
   - `/etc` — System configuration files.
   - `/var` — Logs and variable data.
   - `/bin`, `/sbin` — Essential binaries.
   - `/usr` — User programs and data.

5. **Used `sudo` for Superuser Access**  
   ```bash
   sudo ls /root
   sudo nano /etc/hosts
   sudo apt update
   ```
   - Purpose: Run admin-level commands securely.  
   - Notes:  
     - Only use `sudo` when needed.  
     - Logs actions in `/var/log/auth.log`.

6. **Checked Who I Am and My Privileges**  
   ```bash
   whoami
   id
   groups
   ```
   - Purpose: See the current user, UID/GID, and group memberships.

---

## 📝 Why This Matters

- Navigation is the foundation for working on a Linux system.  
- Knowing the directory structure helps you find files quickly.  
- Understanding `sudo` means you can manage systems without compromising security.

---

## 🔗 Useful Links
- [Linux Filesystem Hierarchy Standard (FHS)](https://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html)
- [GNU Coreutils Manual](https://www.gnu.org/software/coreutils/manual/coreutils.html)
- [Sudo Manual](https://www.sudo.ws/docs/man/)

