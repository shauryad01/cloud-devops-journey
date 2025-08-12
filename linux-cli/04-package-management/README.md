# 04-package-management

Learned how to install, update, remove software, and manage repositories using Linux package managers.

---

## 📌 What I Did

1. **Updated Package Lists**  
   ```bash
   sudo apt update
   sudo yum check-update
   ```
   - Purpose: Refresh the list of available packages and their versions.  
   - `apt` → Debian/Ubuntu-based systems.  
   - `yum` → RHEL/CentOS-based systems.

2. **Upgraded Installed Packages**  
   ```bash
   sudo apt upgrade -y
   sudo yum update -y
   ```
   - Purpose: Install newer versions of already installed packages.

3. **Installed Packages**  
   ```bash
   sudo apt install htop -y
   sudo yum install tree -y
   ```
   - Purpose: Add new software.  
   - Example:
     - `htop` → Interactive process viewer.
     - `tree` → Visual directory tree view.

4. **Removed Packages**  
   ```bash
   sudo apt remove htop -y
   sudo yum remove tree -y
   ```
   - Purpose: Uninstall software while keeping configs.

5. **Purge Packages (APT only)**  
   ```bash
   sudo apt purge htop -y
   ```
   - Purpose: Completely remove a package **and** its configuration files.

6. **Search for Packages**  
   ```bash
   apt search nginx
   yum search httpd
   ```
   - Purpose: Find packages in repositories by name or description.

7. **Add/Remove Repositories**  
   ```bash
   sudo add-apt-repository ppa:deadsnakes/ppa
   sudo apt update
   ```
   - Purpose: Add external sources for software not in the default repo.

8. **Fix Broken Dependencies**  
   ```bash
   sudo apt --fix-broken install
   ```
   - Purpose: Repair issues when installations fail due to missing dependencies.

---

## 📝 Why This Matters

- Every Linux server needs regular package updates for security.  
- Knowing both **APT** and **YUM/DNF** makes you flexible across distributions.  
- Managing repos allows you to install newer or alternative versions of software.

---

## 🔗 Useful Links
- [APT User Guide (Debian/Ubuntu)](https://wiki.debian.org/Apt)
- [YUM/DNF Documentation (RHEL/CentOS/Fedora)](https://dnf.readthedocs.io/en/latest/)
- [Ubuntu Repositories](https://help.ubuntu.com/community/Repositories/Ubuntu)
