# 09 - Permissions and Ownership

Explore the Linux permission model, ownership, symbolic & numeric `chmod`, recursive changes, special bits (setuid/setgid/sticky), default permissions with `umask`, and verification with another user.

---

## 📌 What I Did

### **1) Inspect & Understand Permissions**

- `ls -l`, `ls -lh`, `ls -la` — read the mode string and owner/group columns.  
  Breakdown: `-rwxr-x---` → type, then **user/group/other** triplets.  
  Types: `-` file, `d` directory, `l` symlink.

### **2) Map to Users & Groups**

- `whoami`, `id`, `groups` — tie the `ls -l` **owner** and **group** columns to your actual UID/GID.
- Path/debug helpers:
  - `namei -l /path/to/file` — shows each path component’s perms.
  - `stat file` — verbose metadata (mode, uid/gid, times).

---

### **3) Change Permissions — Symbolic**

Add/remove/set exactly:

```
chmod u+x file.txt
chmod g-w file.txt
chmod o=r file.txt
chmod a+rw file.txt
chmod ug+x script.sh
# Use ls -l before/after to verify.
```

---

### **4) Change Permissions — Numeric (Octal)**

Common sets:

```
chmod 755 script.sh     # rwx r-x r-x
chmod 644 notes.txt     # rw- r-- r--
chmod 600 secret.txt    # rw- --- ---
```

Remember: r=4, w=2, x=1; sum per triplet.

---

### **5) Apply Changes Recursively**

Apply to whole trees:

```
chmod -R 755 mydir/
chmod -R go-w mydir/
```

Validate with a quick tree or multiple `ls -l`.

---

### **6) Change Ownership & Group**

Owner only / owner+group / group only / recursive:

```
sudo chown newuser file.txt
sudo chown newuser:newgroup file.txt
sudo chgrp newgroup file.txt
sudo chown -R newuser:newgroup somedir/
# Check results with ls -l.
```

---

### **7) Special Permissions (setuid, setgid, sticky)**

- **Setuid (u+s)**: run with owner’s privileges (visible as s in owner exec bit).
  ```
  sudo chmod u+s myprog
  ls -l myprog   # e.g., -rwsr-xr-x
  ```
- **Setgid (g+s)**: on files → run with group; on directories → new files inherit the directory’s group.
  ```
  sudo chmod g+s shared_dir
  ls -ld shared_dir  # e.g., drwxr-sr-x
  ```
- **Sticky bit (+t)**: only file owner/dir owner/root can delete inside shared dirs (like /tmp).
  ```
  chmod +t uploads
  ls -ld uploads     # drwxrwxrwt (typical)
  ```
  > Note: Many distros ignore setuid on scripts for execution (security), but the s still displays.

---

### **8) Default Permissions with umask**

Show and change mask, then create fresh files/dirs to see effects:

```
umask          # e.g., 0002
touch a && mkdir d && ls -l a && ls -ld d
umask 022
touch b && mkdir e && ls -l b && ls -ld e   # files → 644, dirs → 755
```

---

### **9) Verify with Another User**

Create a test user and attempt access to prove perms work:

```
sudo useradd -m testuser && sudo passwd testuser
echo "secret" > secret.txt && chmod 600 secret.txt
su - testuser -c "cat /home/<you>/secret.txt"   # Permission denied
chmod 644 secret.txt
su - testuser -c "cat /home/<you>/secret.txt"   # Succeeds
```

---

## 📝 Why This Matters

Correct permissions/ownership **enforce least privilege**, prevent accidental or malicious changes, and enable safe collaboration (e.g., setgid project dirs, sticky-bit temp areas).  
Understanding umask ensures new content is born with sane defaults.

---

## 🔗 Useful Links

- [Chmod Calculator & Cheatsheet](https://chmod-calculator.com/)
- [Linux setuid, setgid, sticky bit explained (GeeksforGeeks)](https://www.geeksforgeeks.org/linux-setuid-setgid-and-sticky-bit/)
- [GNU Coreutils: chmod & chown](https://www.gnu.org/software/coreutils/manual/html_node/chmod-invocation.html)
- [The Linux Documentation Project: File Permissions](https://tldp.org/LDP/intro-linux/html/sect_03_04.html)
