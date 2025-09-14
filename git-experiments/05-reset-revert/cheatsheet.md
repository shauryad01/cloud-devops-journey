# Cheatsheet: 05 – Reset & Revert

## Reset Basics

| Command                    | Description                                                    | Common Switches / Examples                 |
| -------------------------- | -------------------------------------------------------------- | ------------------------------------------ |
| `git reset <hash>`         | Move HEAD to `<hash>` without changing working directory files | —                                          |
| `git reset --soft <hash>`  | Move HEAD to `<hash>` but keep changes staged                  | Use when you want to re-commit changes     |
| `git reset --mixed <hash>` | Move HEAD to `<hash>` and unstage files (default)              | Use when you want to re-stage selectively  |
| `git reset --hard <hash>`  | Move HEAD to `<hash>` and discard all changes                  | **Dangerous:** Deletes uncommitted changes |

---

## Revert Basics

| Command                       | Description                                             | Common Switches / Examples            |
| ----------------------------- | ------------------------------------------------------- | ------------------------------------- |
| `git revert <hash>`           | Create a new commit that undoes the changes of `<hash>` | `git revert a1b2c3d`                  |
| `git revert --no-edit <hash>` | Revert without opening editor for commit message        | —                                     |
| `git revert -n <hash>`        | Stage the revert changes without committing             | Useful for reverting multiple commits |

---

## Undoing Multiple Commits

| Command                      | Description                                |
| ---------------------------- | ------------------------------------------ |
| `git reset HEAD~1`           | Undo last commit, keep changes staged      |
| `git reset --hard HEAD~1`    | Completely discard last commit and changes |
| `git revert <hash1> <hash2>` | Revert multiple commits in one command     |
| `git revert <start>^..<end>` | Revert a range of commits                  |

---

## Safety and Recovery

| Command                     | Description                                            |
| --------------------------- | ------------------------------------------------------ |
| `git reflog`                | Show HEAD history for recovering from accidental reset |
| `git checkout <hash>`       | Temporarily inspect an old commit                      |
| `git branch recover <hash>` | Create a branch at an old commit to recover changes    |

---

## Practical Examples

| Command Pipeline                    | Purpose                                               |
| ----------------------------------- | ----------------------------------------------------- |
| `git log --oneline`                 | View commits and hashes                               |
| `git reset --soft HEAD~2`           | Move back 2 commits but keep changes staged           |
| `git reset --mixed HEAD~1`          | Undo last commit, keep changes unstaged               |
| `git revert HEAD`                   | Safely undo the last commit without rewriting history |
| `git revert --no-edit a1b2c3d`      | Revert a specific commit silently                     |
| `git reset --hard origin/main`      | Force local branch to match remote (⚠️ destructive)   |
| `git reflog && git checkout <hash>` | Recover from a destructive reset using reflog         |
