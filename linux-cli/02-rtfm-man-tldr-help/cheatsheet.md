#  Cheatsheet: 02-RTFM-Man-TLDR-Help

## 1. `man` — Manual Pages
| Command | Description | Notes |
| ------- | ----------- | ----- |
| `man <command>` | Open manual page for command | Example: `man ls` |
| `man -k <keyword>` | Search man pages for a keyword | Similar to `apropos` |
| `man <section> <command>` | Open man page from specific section | Example: `man 5 passwd` |
| **Navigation Keys** | `Space` = next page, `b` = back page, `/` = search, `n` = next match, `q` = quit | |

### Man Page Sections
| Section | Description |
| ------- | ----------- |
| 1 | User commands |
| 2 | System calls |
| 3 | Library functions |
| 4 | Special files |
| 5 | File formats & config |
| 6 | Games |
| 7 | Miscellaneous |
| 8 | System admin commands |

---

## 2. `--help` — Quick Built-in Help
| Command | Description | Notes |
| ------- | ----------- | ----- |
| `<command> --help` | Show usage and options for a command | Example: `ls --help` |

---

## 3. `tldr` — Simplified Examples
| Command | Description | Install |
| ------- | ----------- | ------- |
| `tldr <command>` | Show simplified help with examples | `sudo apt install tldr && tldr --update` |

---

## 4. `info` — GNU Info Pages
| Command | Description | Notes |
| ------- | ----------- | ----- |
| `info <command>` | View GNU-style documentation | Example: `info coreutils` |

---

## 5. Searching for Commands
| Command | Description | Notes |
| ------- | ----------- | ----- |
| `apropos <keyword>` | Search descriptions in man pages | Example: `apropos copy` |
| `whatis <command>` | Show one-line description from man page | Example: `whatis chmod` |

---

## 6. Shell Built-in Help
| Command | Description | Notes |
| ------- | ----------- | ----- |
| `help` | List built-in shell commands | Bash-only |
| `help <builtin>` | Help for a shell builtin | Example: `help cd` |
| `type <command>` | Check if command is builtin, alias, or executable | Example: `type cd` |

---

## 7. Locating Commands & Docs
| Command | Description | Notes |
| ------- | ----------- | ----- |
| `which <command>` | Show full path to command binary | Example: `which python3` |
| `whereis <command>` | Show binary, source, and man page location | Example: `whereis ls` |
