# 02 – Diff, Stash, and Tags

This one was about comparing changes, pausing work mid-way, and tagging important commits. Mostly exploring how Git helps when you’re *not ready to commit* yet or need to mark a checkpoint.

## Commands I used & what for:

- `git diff` – Compared unstaged and staged changes. Also used `git diff --staged` and `git diff <commit1> <commit2>` to see changes across versions.

- `git stash` – Parked my current work without committing it. Tested basic stash + named stash (`git stash save "msg"`).

- `git stash apply`, `git stash pop` – Reapplied stashed changes. `pop` also clears them from stash list.

- `git stash list`, `git stash show` – Listed and inspected saved stashes.

- `git stash drop` – Deleted a specific stash when I didn’t need it anymore.

- `git tag` – Created lightweight and annotated tags to mark versions or checkpoints.

- `git tag -a`, `git show <tag>` – Used annotated tags with messages. `show` gave full details of the tagged commit.
