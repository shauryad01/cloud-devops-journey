# Cheatsheet: 03 - Navigating-File-Structure-and-Superuser

## Navigation Basics

| Command     | Description                                   | Common Switches / Examples       |
| ----------- | --------------------------------------------- | -------------------------------- |
| `cd <path>` | Change to the specified directory             | `cd /var/log` → go to `/var/log` |
| `cd ..`     | Go back one directory (parent folder)         | —                                |
| `cd ../..`  | Go back two directories                       | —                                |
| `cd ~`      | Go to current user’s home directory           | —                                |
| `cd -`      | Switch to the previous working directory      | —                                |
| `pwd`       | Print the full current working directory path | —                                |

---

### Listing Files & Directories

| Command      | Description                   | Common Switches / Examples                                                                                                                                 |
| ------------ | ----------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ls`         | List directory contents       | `-l` long format, `-a` include hidden files, `-lh` human-readable sizes, `-lt` sort by modification time, `-ltr` oldest first, `/etc/*.conf` pattern match |
| `tree /path` | Show directory tree structure | `-L 2` limit depth                                                                                                                                         |

---

### File Viewing & Reading

| Command                  | Description                                             | Common Switches / Examples                   |
| ------------------------ | ------------------------------------------------------- | -------------------------------------------- |
| `cat <filename>`         | Show entire file contents on screen                     | —                                            |
| `cat > <new-filename>`   | Create a file and write contents (overwrites if exists) | Press `CTRL+D` to save                       |
| `cat <file1> >> <file2>` | Append contents of file1 into file2                     | —                                            |
| `head -n <N> <file>`     | Show first N lines of a file                            | `head -n 20 file.txt`                        |
| `tail -n <N> <file>`     | Show last N lines of a file                             | —                                            |
| `more <file>`            | View file page-by-page (forward only)                   | Space to scroll, `q` to quit                 |
| `less <file>`            | View file with scroll (forward/backward)                | ↑/↓ arrows to navigate, `/keyword` to search |

---

### File & Directory Management

| Command                     | Description                                         | Common Switches / Examples                         |
| --------------------------- | --------------------------------------------------- | -------------------------------------------------- |
| `touch <new-file>`          | Create a blank file (or update timestamp if exists) | —                                                  |
| `mkdir <new-dir>`           | Create a new folder                                 | —                                                  |
| `mkdir -p test/test1/test2` | Create nested folders in one command                | `-p` creates intermediate directories              |
| `mv <file> <dir>`           | Move file to a different directory                  | —                                                  |
| `mv <file> <new-filename>`  | Rename a file                                       | —                                                  |
| `mv -R <dir1> <dir2>`       | Move a directory and its contents                   | `-r` recursive move                                |
| `cp <src> <dest>`           | Copy file to new location                           | `-r` for copying folders                           |
| `rm <filename>`             | Delete file permanently                             | `-R` remove folder and all subcontents, `-f` force |

---

### Superuser & Permissions

| Command          | Description                                     | Common Switches / Examples                                       |
| ---------------- | ----------------------------------------------- | ---------------------------------------------------------------- |
| `sudo <command>` | Run command with superuser (root) privileges    | `-i` start root shell, `-u <user> <command>` run as another user |
| `sudo visudo`    | Safely edit sudoers file for permission control | Opens in default editor, prevents syntax errors                  |

---

### Linux Directory Structure

| Path    | Purpose                            |
| ------- | ---------------------------------- |
| `/`     | Root directory                     |
| `/home` | User home folders                  |
| `/etc`  | System configuration               |
| `/var`  | Logs & variable data               |
| `/bin`  | Essential binaries                 |
| `/sbin` | System binaries                    |
| `/usr`  | Installed programs & data          |
| `/tmp`  | Temporary files                    |
| `/opt`  | Optional add-on software           |
| `/dev`  | Device files                       |
| `/proc` | Kernel & process info (virtual FS) |
