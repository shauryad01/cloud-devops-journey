# 08 - File and Directory Operations

Covered core Linux commands for creating, viewing, copying, moving, deleting, and organizing files and directories, including working with links, archives, and basic file information utilities.

## 📌 What I Did

1.  **Created and viewed files**

    - `touch file1.txt` — create an empty file.
    - `echo "Hello" > file2.txt` — write text to a file (overwrite).
    - `echo "More text" >> file2.txt` — append to file.
    - `cat file2.txt` — view file contents.
    - `nano notes.txt` — create/edit file in nano.
    - `more file2.txt` / `less file2.txt` — scroll through file output.

2.  **Copied files and directories**

    - `cp file2.txt copy1.txt` — copy file.
    - `cp -r dir1 dir1_backup` — copy directory recursively.
    - `cp -i file2.txt copy1.txt` — prompt before overwrite.

3.  **Moved and renamed**

    - `mv file2.txt renamed.txt` — rename a file.
    - `mv renamed.txt dir1/` — move file into directory.
    - `mv -i file3.txt dir1/` — prompt before overwrite.

4.  **Removed files and directories**

    - `rm file1.txt` — delete file.
    - `rm -i file3.txt` — confirm before delete.
    - `rm -r dir1` — remove directory and contents.
    - `rm -rf dir1` — force remove without prompts.
    - `rmdir emptydir` — remove empty directory.

5.  **Created directories**

    - `mkdir dir1` — create folder.
    - `mkdir -p parent/child/grandchild` — create nested structure.

6.  **Archived and compressed**

    - `tar -czvf archive.tar.gz dir1/` — create compressed tarball.
    - `tar -xzvf archive.tar.gz` — extract tarball.
    - `zip -r archive.zip dir1/` — zip folder.
    - `unzip archive.zip` — extract zip.
    - `gzip filename.txt` — compress a single file.
    - `gunzip filename.txt.gz` — decompress a `.gz` file.

7.  **Worked with links**

    - `ln file2.txt hardlink1` — create hard link.
    - `ln -s file2.txt softlink1` — create soft link.
    - `ls -li` — check inode numbers.
    - Deleted original file to compare hard vs soft link behavior.

8.  **File information and search**

    - `file file2.txt` — check file type.
    - `stat file2.txt` — view file metadata (size, permissions, timestamps).
    - `find . -type f -name "*.txt"` — find files matching pattern.
    - `du -sh dir1/` — check folder size.
    - `df -h` — view disk usage by filesystem.

## 📝 Why This Matters

- File and directory operations are fundamental to every Linux workflow.
- Archiving and compression are essential for backups, deployments, and transfers.
- Links provide flexible ways to reference files without duplication.
- Utilities like `find`, `du`, and `df` are vital for locating files and managing storage efficiently.

## 🔗 Useful Links

- [GNU Coreutils Manual](https://www.gnu.org/software/coreutils/manual/coreutils.html)
- [tar Manual](https://labex.io/tutorials/linux-file-packaging-and-compression-385413)
- [Packaging and Compression](https://labex.io/tutorials/linux-file-packaging-and-compression-385413)
