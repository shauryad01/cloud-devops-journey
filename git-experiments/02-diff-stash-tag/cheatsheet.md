# Cheatsheet: 02 – Diff, Stash & Tag

## Viewing Differences (Diff)

| Command                        | Description                                | Common Switches / Examples   |
| ------------------------------ | ------------------------------------------ | ---------------------------- |
| `git diff`                     | Show unstaged changes                      | —                            |
| `git diff --staged`            | Show staged changes (ready to commit)      | —                            |
| `git diff <commit>`            | Compare working tree to a commit           | `git diff HEAD~1`            |
| `git diff <commit1> <commit2>` | Compare two commits                        | `git diff featureA featureB` |
| `git log -p`                   | Show commit history with patch/diff output | —                            |

---

## Stashing Changes

| Command                    | Description                                   | Common Switches / Examples  |
| -------------------------- | --------------------------------------------- | --------------------------- |
| `git stash`                | Save (stash) uncommitted changes              | —                           |
| `git stash save "msg"`     | Save changes with a custom message            | —                           |
| `git stash list`           | List all stashes                              | —                           |
| `git stash show`           | Show summary of most recent stash             | `-p` to show patch          |
| `git stash apply`          | Reapply most recent stash (keeps it in stash) | `git stash apply stash@{2}` |
| `git stash pop`            | Apply and **remove** most recent stash        | —                           |
| `git stash drop stash@{N}` | Delete a specific stash                       | —                           |
| `git stash clear`          | Remove **all** stashes                        | —                           |

---

## Tagging Commits

| Command                     | Description                                | Common Switches / Examples          |
| --------------------------- | ------------------------------------------ | ----------------------------------- |
| `git tag`                   | List all tags                              | —                                   |
| `git tag <tag>`             | Create a lightweight tag on latest commit  | `git tag v1.0`                      |
| `git tag -a <tag> -m "msg"` | Create an **annotated** tag with a message | `git tag -a v1.0 -m "Release v1.0"` |
| `git show <tag>`            | View the commit and message for a tag      | —                                   |
| `git tag -d <tag>`          | Delete a local tag                         | —                                   |
| `git push origin <tag>`     | Push a specific tag to remote              | —                                   |
| `git push origin --tags`    | Push **all** tags to remote                | —                                   |

---

## Practical Examples

| Command Pipeline                                                              | Purpose                                                  |
| ----------------------------------------------------------------------------- | -------------------------------------------------------- |
| `git diff main..feature && git stash save "WIP feature" && git checkout main` | Review changes, stash work-in-progress, switch branches. |
| `git tag -a v2.0 -m "Version 2.0 release" && git push origin v2.0`            | Create and push an annotated release tag.                |
| `git stash pop && git diff --staged`                                          | Restore stashed work and check staged changes.           |
