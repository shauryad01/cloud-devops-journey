# Cheatsheet: 05 - Vim Editing

## **Vim Modes**

| Mode             | Enter                                    | Exit / Notes                           |
| ---------------- | ---------------------------------------- | -------------------------------------- |
| Normal (command) | `Esc`                                    | Default mode for navigation & commands |
| Insert           | `i`, `I`, `a`, `A`, `o`, `O`             | `Esc` to go back to Normal mode        |
| Visual           | `v` (char), `V` (line), `Ctrl+v` (block) | `Esc` to go back to Normal mode        |

---

## **Basic Navigation**

| Command | Description                          |
| ------- | ------------------------------------ |
| `h`     | Move left                            |
| `l`     | Move right                           |
| `j`     | Move down                            |
| `k`     | Move up                              |
| `0`     | Go to start of line                  |
| `^`     | Go to first non-whitespace character |
| `$`     | Go to end of line                    |
| `w`     | Jump to start of next word           |
| `e`     | Jump to end of current/next word     |
| `gg`    | Go to start of file                  |
| `G`     | Go to end of file                    |
| `:n`    | Go to line number `n`                |

---

## **Editing**

| Command  | Description                   |
| -------- | ----------------------------- |
| `i`      | Insert before cursor          |
| `I`      | Insert at start of line       |
| `a`      | Append after cursor           |
| `A`      | Append at end of line         |
| `o`      | Open new line below           |
| `O`      | Open new line above           |
| `x`      | Delete character under cursor |
| `dd`     | Delete (cut) current line     |
| `yy`     | Yank (copy) current line      |
| `p`      | Paste after cursor            |
| `P`      | Paste before cursor           |
| `u`      | Undo last change              |
| `Ctrl+r` | Redo undone change            |

---

## **Search & Replace**

| Command            | Description                         |
| ------------------ | ----------------------------------- |
| `/pattern`         | Search forward for "pattern"        |
| `?pattern`         | Search backward for "pattern"       |
| `n`                | Repeat search in same direction     |
| `N`                | Repeat search in opposite direction |
| `:%s/old/new/g`    | Replace all occurrences in file     |
| `:n,m s/old/new/g` | Replace between lines `n` and `m`   |

---

## **File Commands**

| Command            | Description              |
| ------------------ | ------------------------ |
| `:w`               | Save file                |
| `:q`               | Quit                     |
| `:q!`              | Quit without saving      |
| `:wq` or `ZZ`      | Save and quit            |
| `:e filename`      | Open another file        |
| `:saveas filename` | Save file under new name |

---

## **Useful Combos**

| Command   | Description                             |
| --------- | --------------------------------------- |
| `d$`      | Delete to end of line                   |
| `d^`      | Delete to first non-whitespace char     |
| `y$`      | Yank to end of line                     |
| `c$`      | Change (delete + insert) to end of line |
| `>>`      | Indent line right                       |
| `<<`      | Indent line left                        |
| `:%!sort` | Sort all lines in file                  |
| `:%!uniq` | Remove duplicate lines                  |

---

## **Paths & Config**

| Path             | Purpose                     |
| ---------------- | --------------------------- |
| `~/.vimrc`       | User Vim configuration file |
| `/etc/vim/vimrc` | System-wide configuration   |

---

## **Tips**

- If stuck in a weird mode, press `Esc` repeatedly until back to Normal mode.
- Use `:help <command>` for built-in documentation (e.g., `:help yy`).
