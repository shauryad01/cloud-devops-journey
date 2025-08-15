# Cheatsheet: 08 – File and Directory Operations

---

## **File Creation & Viewing**

| Command               | Description                              | Common Switches / Examples           |
| --------------------- | ---------------------------------------- | ------------------------------------ |
| `touch <file>`        | Create an empty file or update timestamp | `touch notes.txt`                    |
| `echo "text" > file`  | Write text to file (overwrite)           | `echo "Hello" > file1.txt`           |
| `echo "text" >> file` | Append text to file                      | `echo "Extra" >> file1.txt`          |
| `cat <file>`          | View entire file contents                | `cat notes.txt`                      |
| `nano <file>`         | Create/edit file in nano editor          | —                                    |
| `more <file>`         | View file page-by-page (forward only)    | Space to scroll, `q` to quit         |
| `less <file>`         | View file with scroll and search         | `/pattern` to search, `n` next match |

---

## **Copying**

| Command              | Description                | Common Switches / Examples |
| -------------------- | -------------------------- | -------------------------- |
| `cp <src> <dest>`    | Copy file                  | `cp file1.txt backup.txt`  |
| `cp -r <dir> <dest>` | Copy directory recursively | `cp -r dir1 dir1_backup`   |
| `cp -i <src> <dest>` | Prompt before overwrite    | —                          |

---

## **Moving & Renaming**

| Command              | Description              | Common Switches / Examples |
| -------------------- | ------------------------ | -------------------------- |
| `mv <src> <dest>`    | Move or rename a file    | `mv old.txt new.txt`       |
| `mv <file> <dir>`    | Move file into directory | `mv report.txt docs/`      |
| `mv -i <src> <dest>` | Prompt before overwrite  | —                          |

---

## **Deleting**

| Command        | Description                  | Common Switches / Examples |
| -------------- | ---------------------------- | -------------------------- |
| `rm <file>`    | Delete file                  | —                          |
| `rm -i <file>` | Prompt before delete         | —                          |
| `rm -r <dir>`  | Delete directory recursively | —                          |
| `rm -rf <dir>` | Force delete without prompts | —                          |
| `rmdir <dir>`  | Remove empty directory       | —                          |

---

## **Directory Creation**

| Command                | Description               | Common Switches / Examples |
| ---------------------- | ------------------------- | -------------------------- |
| `mkdir <dir>`          | Create new directory      | —                          |
| `mkdir -p path/to/dir` | Create nested directories | `mkdir -p parent/child`    |

---

## **Archiving & Compression**

| Command                     | Description               | Common Switches / Examples      |
| --------------------------- | ------------------------- | ------------------------------- |
| `tar -czvf file.tar.gz dir` | Create compressed tarball | `tar -czvf backup.tar.gz docs/` |
| `tar -xzvf file.tar.gz`     | Extract tarball           | —                               |
| `zip -r file.zip dir`       | Create zip archive        | —                               |
| `unzip file.zip`            | Extract zip file          | —                               |
| `gzip <file>`               | Compress file to `.gz`    | `gzip notes.txt`                |
| `gunzip <file.gz>`          | Decompress `.gz` file     | `gunzip notes.txt.gz`           |

---

## **Links**

| Command              | Description                  | Common Switches / Examples |
| -------------------- | ---------------------------- | -------------------------- |
| `ln <src> <link>`    | Create hard link             | `ln file1.txt link1`       |
| `ln -s <src> <link>` | Create soft link             | `ln -s file1.txt symlink1` |
| `ls -li`             | View inode numbers for links | —                          |

---

## **File Info & Search**

| Command                             | Description                          | Common Switches / Examples     |
| ----------------------------------- | ------------------------------------ | ------------------------------ |
| `file <file>`                       | Show file type                       | —                              |
| `stat <file>`                       | Show file metadata                   | —                              |
| `find <path> -type f -name "*.ext"` | Search files by name and type        | `find . -type f -name "*.txt"` |
| `du -sh <dir>`                      | Show directory size (human readable) | —                              |
| `df -h`                             | Show disk usage for filesystems      | —                              |
