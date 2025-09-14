# Cheatsheet: 03 – Rebase & Reflog

## Rebasing Basics

| Command                  | Description                                              | Common Switches / Examples              |
| ------------------------ | -------------------------------------------------------- | --------------------------------------- |
| `git rebase <branch>`    | Reapply commits from the current branch onto `<branch>`  | `git rebase main`                       |
| `git rebase -i <commit>` | Interactive rebase—edit, squash, or reorder commits      | `git rebase -i HEAD~3` (last 3 commits) |
| `git rebase --continue`  | Continue after resolving conflicts during a rebase       | —                                       |
| `git rebase --abort`     | Cancel an in-progress rebase and return to original HEAD | —                                       |
| `git rebase --skip`      | Skip the current conflicting commit during rebase        | —                                       |
| `git pull --rebase`      | Fetch latest changes and rebase instead of merging       | —                                       |

---

## Interactive Rebase Actions

| Action   | Purpose                                                      |
| -------- | ------------------------------------------------------------ |
| `pick`   | Keep the commit as is                                        |
| `reword` | Edit the commit message only                                 |
| `edit`   | Pause to amend the commit                                    |
| `squash` | Combine this commit into the previous commit (keep messages) |
| `fixup`  | Combine this commit into the previous commit (discard msg)   |
| `drop`   | Remove the commit entirely                                   |

---

## Reflog Basics

| Command                     | Description                                       | Common Switches / Examples   |
| --------------------------- | ------------------------------------------------- | ---------------------------- |
| `git reflog`                | Show a log of all HEAD changes (even unreachable) | —                            |
| `git reflog show`           | Same as `git reflog`                              | —                            |
| `git checkout HEAD@{n}`     | Checkout repository state from n steps back       | `git checkout HEAD@{3}`      |
| `git reset --hard HEAD@{n}` | Reset branch to a previous reflog entry           | `git reset --hard HEAD@{5}`  |
| `git branch <new> HEAD@{n}` | Create new branch from old state                  | `git branch rescue HEAD@{4}` |

---

## Practical Examples

| Command Pipeline                      | Purpose                                               |
| ------------------------------------- | ----------------------------------------------------- |
| `git rebase -i HEAD~5`                | Clean up last 5 commits (squash or reword)            |
| `git reflog && git checkout HEAD@{4}` | View reflog and move to repository state 4 steps back |
| `git pull --rebase origin main`       | Update branch with upstream changes via rebase        |
| `git reset --hard HEAD@{2}`           | Recover repository to a known good state              |
