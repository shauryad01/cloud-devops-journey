# Cheatsheet: 01 – Branching & Merge

## Branch Basics

| Command                     | Description                              | Common Switches / Examples   |
| --------------------------- | ---------------------------------------- | ---------------------------- |
| `git branch`                | List all local branches                  | —                            |
| `git branch <name>`         | Create a new branch                      | `git branch feature-login`   |
| `git checkout <name>`       | Switch to an existing branch             | `git checkout main`          |
| `git checkout -b <name>`    | Create **and** switch to a new branch    | `git checkout -b hotfix-001` |
| `git branch -d <name>`      | Delete a branch (already merged)         | `git branch -d old-feature`  |
| `git branch -D <name>`      | Force-delete a branch (even if unmerged) | —                            |
| `git branch -m <old> <new>` | Rename a branch                          | `git branch -m dev staging`  |

---

## Merging

| Command                      | Description                              | Common Switches / Examples           |
| ---------------------------- | ---------------------------------------- | ------------------------------------ |
| `git merge <branch>`         | Merge `<branch>` into the current branch | `git merge feature-login`            |
| `git merge --no-ff <branch>` | Force a merge commit (no fast-forward)   | Useful for preserving branch history |
| `git merge --abort`          | Cancel an in-progress merge              | —                                    |

---

## Viewing Merge Info

| Command                           | Description                           | Examples                       |
| --------------------------------- | ------------------------------------- | ------------------------------ |
| `git log --graph --oneline --all` | View commit history with branch graph | —                              |
| `git diff <branch1>..<branch2>`   | See differences between branches      | `git diff main..feature-login` |
| `git status`                      | Check working tree and staged changes | —                              |

---

## Handling Conflicts

| Step / Command                                           | Description                                              |
| -------------------------------------------------------- | -------------------------------------------------------- |
| Edit files marked with `<<<<<<<` / `=======` / `>>>>>>>` | Manually resolve conflicting sections.                   |
| `git add <file>`                                         | Mark the conflict as resolved.                           |
| `git merge --continue`                                   | Continue the merge after resolving conflicts.            |
| `git checkout --ours <file>`                             | Use your branch’s version of a conflicted file.          |
| `git checkout --theirs <file>`                           | Use the merged-in branch’s version of a conflicted file. |

---

## Practical Example Pipeline

| Command Pipeline                                                                                                       | Purpose                                           |
| ---------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------- |
| `git checkout -b feature-ui && edit files && git commit -am "UI changes" && git checkout main && git merge feature-ui` | Create a feature branch, commit, merge into main. |
| `git log --graph --oneline --all`                                                                                      | Visualize history after merging.                  |
