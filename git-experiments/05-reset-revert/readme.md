# 05 – Reset & Revert

This one was all about undoing changes — both the safe way and the destructive way. Reset messed with history. Revert played it safer.

## Commands I used & what for:

- `git reset --soft` – Moved HEAD to an earlier commit but kept everything staged.

- `git reset --mixed` – Default reset. Unstaged changes but didn’t delete them.

- `git reset --hard` – Completely wiped changes and moved HEAD. Use with caution.

- `git revert <commit>` – Created a new commit to undo a previous one without rewriting history.

- `git log`, `git status` – Used constantly to track what changed and what Git was doing.

---

Reset is powerful but risky. Revert feels safer when you're working with shared history.
