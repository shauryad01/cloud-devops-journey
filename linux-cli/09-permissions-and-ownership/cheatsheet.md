# Cheatsheet: 09 - Permissions and Ownership

## Inspecting Permissions

| Command                  | Description                              | Example / Notes                             |
| ------------------------ | ---------------------------------------- | ------------------------------------------- |
| `ls -l`                  | Show long listing with perms/owner/group | `-rwxr-xr-- 1 user group 0 Aug 16 file.txt` |
| `ls -la`                 | Include hidden files                     | —                                           |
| `stat file`              | Detailed metadata (mode, uid/gid, times) | `stat notes.txt`                            |
| `namei -l /path/file`    | Break down each path component’s perms   | Shows perms at each directory level         |
| `id`, `whoami`, `groups` | Show current UID, username, and groups   | —                                           |

---

## Permission Basics

| Triplet | Meaning                      |
| ------- | ---------------------------- |
| `r`     | Read                         |
| `w`     | Write                        |
| `x`     | Execute (file) / Enter (dir) |
| `-`     | No permission                |

Order: **User (owner) → Group → Others**

---

## Changing Permissions (Symbolic)

| Command                | Description               | Example |
| ---------------------- | ------------------------- | ------- |
| `chmod u+x file`       | Add execute for user      | —       |
| `chmod g-w file`       | Remove write from group   | —       |
| `chmod o=r file`       | Set others to read-only   | —       |
| `chmod a+rw file`      | Add read/write for all    | —       |
| `chmod ug+x script.sh` | Add exec for user & group | —       |

---

## Changing Permissions (Numeric)

| Mode | Meaning                        | Example                |
| ---- | ------------------------------ | ---------------------- |
| 755  | rwx r-x r-x                    | `chmod 755 script.sh`  |
| 644  | rw- r-- r--                    | `chmod 644 notes.txt`  |
| 600  | rw- --- ---                    | `chmod 600 secret.txt` |
| 777  | rwx rwx rwx (danger!)          | `chmod 777 file`       |
| Calc | r=4, w=2, x=1; sum per triplet | Example: 7 = rwx       |

---

## Recursive Changes

| Command              | Description                               |
| -------------------- | ----------------------------------------- |
| `chmod -R 755 dir/`  | Apply perms recursively to directory tree |
| `chmod -R go-w dir/` | Remove write for group/others recursively |

---

## Ownership & Group

| Command                            | Description                |
| ---------------------------------- | -------------------------- |
| `sudo chown newuser file`          | Change file owner          |
| `sudo chown newuser:newgroup file` | Change owner and group     |
| `sudo chgrp newgroup file`         | Change group only          |
| `sudo chown -R user:group dir/`    | Recursive ownership change |

---

## Special Permissions

| Bit        | Command              | Effect                                                                | Display      |
| ---------- | -------------------- | --------------------------------------------------------------------- | ------------ |
| **Setuid** | `chmod u+s file`     | File runs with **owner’s** privileges                                 | `-rwsr-xr-x` |
| **Setgid** | `chmod g+s file/dir` | File: runs with **group’s** privileges. Dir: new files inherit group. | `drwxr-sr-x` |
| **Sticky** | `chmod +t dir/`      | Only owner/root can delete inside dir                                 | `drwxrwxrwt` |

---

## Default Permissions (`umask`)

| Command              | Description                              | Example                       |
| -------------------- | ---------------------------------------- | ----------------------------- |
| `umask`              | Show current mask (e.g., 0002)           | Default → files 664, dirs 775 |
| `umask 022`          | Change mask to 022 (files 644, dirs 755) | —                             |
| `touch f && mkdir d` | Create new file/dir to confirm defaults  | —                             |

---

## Test Permissions with Another User

| Command                                            | Description                           |
| -------------------------------------------------- | ------------------------------------- |
| `sudo useradd -m testuser && sudo passwd testuser` | Create test user                      |
| `su - testuser`                                    | Switch to new user                    |
| `su - testuser -c "cat file.txt"`                  | Try accessing file with current perms |
| Modify perms with `chmod`/`chown` and retest       | Confirm allowed/denied                |
