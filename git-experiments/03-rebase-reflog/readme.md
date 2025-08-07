# 03 – Rebase & Reflog

This part was about rewriting commit history and recovering from mistakes. Rebase helped clean up the log, but it’s easy to mess things up if you don’t know what you're doing. Reflog = life saver.

## Commands I used & what for:

- `git rebase` – Re-applied commits from one branch onto another for a linear history.  

- `git rebase -i` – Used interactive mode to squash, reorder, and clean up commit messages.

- `git merge` – Compared it with rebase to understand how both handle combining branches.  

- `git rebase` (again) – Simulated a conflict during rebase and fixed it manually.  

- `git reflog` – Used to recover from mistakes and navigate previous HEAD positions.  

- `git checkout <reflog-hash>` – Restored broken state after a bad rebase.

- `git reset --hard <commit>` – Used to clean up after experimenting with broken rebase flows.

---

I also used a few test files to simulate messy commit histories.  
*(see: `files_for_rebase.jpg`)*
