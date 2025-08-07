# 04 – Cherry Picking 

Tested how to move specific commits from one branch to another without merging the full branch.

## Commands I used & what for:

- `git cherry-pick <commit>` – Took a single commit from one branch and applied it to another.

- `git log --oneline` – Used to grab the commit hash I wanted to pick.

- `git cherry-pick --continue` – Used this after resolving conflicts during a pick.

- `git cherry-pick --abort` – Backed out of a bad cherry-pick when things went sideways.
