# Cheatsheet: 04 – Cherry-Picking

## Basics of Cherry-Pick

| Command                       | Description                                                    | Common Switches / Examples        |
| ----------------------------- | -------------------------------------------------------------- | --------------------------------- |
| `git cherry-pick <hash>`      | Apply the changes from a specific commit to the current branch | `git cherry-pick a1b2c3d`         |
| `git cherry-pick <h1>..<h2>`  | Apply a range of commits (excluding `<h1>`)                    | `git cherry-pick a1b2c3..d4e5f6`  |
| `git cherry-pick <h1>^..<h2>` | Apply a range including `<h1>`                                 | `git cherry-pick a1b2c3^..d4e5f6` |

---

## Handling Conflicts

| Command                      | Description                                            |
| ---------------------------- | ------------------------------------------------------ |
| `git cherry-pick --abort`    | Abort the cherry-pick and return to the original state |
| `git cherry-pick --continue` | Continue after resolving conflicts                     |
| `git cherry-pick --skip`     | Skip the problematic commit and continue with the rest |

---

## Advanced Usage

| Command                                                 | Description                                                                  |
| ------------------------------------------------------- | ---------------------------------------------------------------------------- |
| `git cherry-pick -x <hash>`                             | Add a reference to the original commit in the new commit                     |
| `git cherry-pick -e <hash>`                             | Edit the commit message during cherry-pick                                   |
| `git cherry-pick -n <hash>`                             | Apply changes without committing (stage for manual commit)                   |
| `git cherry-pick --strategy=recursive -X theirs <hash>` | Use a merge strategy to resolve conflicts automatically in favor of "theirs" |

---

## Practical Examples

| Command Pipeline                        | Purpose                                                  |
| --------------------------------------- | -------------------------------------------------------- |
| `git log --oneline`                     | Get commit hashes to cherry-pick                         |
| `git checkout feature-branch`           | Switch to the branch where you want to apply the commit  |
| `git cherry-pick f7g8h9i`               | Bring a single commit into your current branch           |
| `git cherry-pick a1b2c3d^..d4e5f6g`     | Apply multiple consecutive commits                       |
| `git cherry-pick --abort && git status` | Abort a problematic cherry-pick and inspect working tree |
