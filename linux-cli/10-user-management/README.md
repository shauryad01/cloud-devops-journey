# 10 – User Management

Learned how to create, modify, delete, and manage users and groups in Linux, along with password policies and sudo privileges.

---

## 📌 What I Did

**Explored Current Users**

```
whoami
id
groups
who
w
cat /etc/passwd | less
cat /etc/group | less
sudo cat /etc/shadow | head -5
```

- Checked identity and groups.
- Viewed user, group, and password databases.

---

**Created Users**

```
sudo useradd -m alice
sudo passwd alice
sudo useradd -m -s /bin/bash bob
sudo useradd -m -c "Bob Marley" bob2
```

- `-m`: Create home directory.
- `-s`: Set login shell.
- `-c`: Add description.

---

**Modified Users**

```
sudo usermod -l newalice alice         # Change username
sudo usermod -d /home/alice2 -m alice  # Move home directory
sudo passwd -l alice                   # Lock account
sudo passwd -u alice                   # Unlock account
sudo usermod -e 2025-08-30 alice       # Expire account
```

- Learned to rename, move, lock/unlock, and expire users.

---

**Deleted Users**

```
sudo userdel alice      # Delete user, keep home
sudo userdel -r bob     # Delete user and home
```

---

**Group Management**

```
sudo groupadd devs
sudo usermod -aG devs alice
groups alice
sudo groupdel devs
```

- Created groups, added users, verified membership, removed groups.

---

**Switching Users**

```
su - alice
sudo -u alice whoami
```

- Switched into user shell or ran single commands as another user.

---

**Default Settings**

```
ls -la /etc/skel
cat /etc/default/useradd
```

- `/etc/skel` → default files for new users.
- `/etc/default/useradd` → default shell, home base, etc.
- Used `/sbin/nologin` to disable interactive logins.

---

**Password & Authentication**

```
sudo chage -l alice
sudo chage -M 30 alice
sudo chage -E 2025-09-30 alice
cat /etc/login.defs
```

- Viewed and set password expiry, max days, and account expiration.
- Checked system-wide defaults in `/etc/login.defs`.

---

**Sudo Access**

```
sudo usermod -aG sudo alice
su - alice
sudo whoami
```

- Added user to sudo group and verified elevated privileges.

---

**User Management Files**

- `/etc/passwd` → user details
- `/etc/shadow` → encrypted passwords
- `/etc/group`, `/etc/gshadow` → groups
- `/etc/sudoers` → sudo privileges (edit safely with visudo)
- `/etc/skel/` → default config files for new users
- `/var/log/auth.log` → login & sudo history

---

## 📝 Why This Matters

- **Security:** Enforces account policies and prevents privilege misuse.
- **Lifecycle Management:** Full control from user creation to deletion.
- **Administration:** Ensures correct group memberships and sudo access.
- **Defaults & Policies:** Skeleton configs and password expiry keep accounts consistent and secure.

---

## 🔗 Useful Links

- [Linux Useradd Documentation](https://man7.org/linux/man-pages/man8/useradd.8.html)
- [Linux Usermod Documentation](https://man7.org/linux/man-pages/man8/usermod.8.html)
- [Sudoers Manual](https://www.sudo.ws/man/1.8.25/sudoers.man.html)
- [Linux User Management Guide](https://www.geeksforgeeks.org/linux-unix/user-management-in-linux/)
