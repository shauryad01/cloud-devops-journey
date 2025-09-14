# 05-vim-editing

Learned how to navigate, edit, search, and manage files in Vim — a powerful text editor that’s built into almost every Unix/Linux system.

---

## 📌 What I Did

### Opened Files in Vim

```bash
vim filename
```

Purpose: Start editing a file in Vim.
If the file doesn’t exist, Vim will create it when saved.

### Understood Vim Modes:

- Normal Mode → default mode for navigation and commands.
- Insert Mode → for typing and editing text
- i → insert before cursor
- a → insert after cursor
- o → open new line below
- Visual Mode → for selecting blocks of text.
- Switch back to Normal Mode from anywhere with Esc.

### Basic Navigation

- h / l → move left / right by char
- w / e / b → move by words
- 0 / $ → jump to line start / end
- :10 → go to line 10
- /pattern → search for text
- n / N → repeat search forward / backward

### Editing Essentials

- x → delete character
- dw → delete word
- dd → delete line
- u → undo
- Ctrl+r → redo
- yy → copy (yank) line
- p → paste after cursor

### Saving & Quitting

- :w → save
- :wq → save & quit
- :q! → quit without saving
- ZZ → save & quit (shortcut)

### Search & Replace

- /keyword → search keyword
- :%s/old/new/g → replace all in file
- :%s/old/new/gc → replace with confirmation

### Working with Multiple Files

- vim file1 file2 # open multiple files
- :n # go to next file
- :prev # go to previous file

### Useful DevOps Shortcuts

- `%` → go to matching bracket/brace
- `>>` → indent block
- `<<` → unindent block
- (Visual block + I#) → comment multiple lines

### Practice with Real Config Files

    sudo vim /etc/hosts

Purpose: Practice editing system config files.
Deliberate break & fix: Mis-edit /etc/hosts and restore from backup to learn recovery.

---

## Cheatsheet

Checkout this Cheatsheet that I created:
[Vim Cheatsheet](https://github.com/shauryad01/cloud-devops-journey/blob/main/linux-cli/05-vim-editing/cheatsheet.md)

### 📝 Why This Matters

Vim is available on almost all Linux/Unix systems — including minimal servers.

Mastering navigation and editing commands makes remote config edits fast and efficient.

Many DevOps tools (like Git commit messages, crontab, and Docker configs) open in Vim by default.

🔗 Useful Links

- [Vim Official Documentation](https://www.vim.org/docs.php)
- [Vim Cheat Sheet](https://vim.rtorr.com/)
