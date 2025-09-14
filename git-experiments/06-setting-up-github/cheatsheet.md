# Cheatsheet: 06 – Setting Up GitHub

## Initial Configuration

| Command                                            | Description                           | Common Switches / Examples                  |
| -------------------------------------------------- | ------------------------------------- | ------------------------------------------- |
| `git config --global user.name "Your Name"`        | Set your name for commits             | Replace `"Your Name"` with your actual name |
| `git config --global user.email "you@example.com"` | Set your email for commits            | Use the email linked to your GitHub account |
| `git config --global init.defaultBranch main`      | Set default branch name for new repos | Avoids older `master` default               |
| `git config --list`                                | View all Git configurations           | —                                           |

---

## Authenticating with GitHub

| Command/Step                                 | Description                                                     |
| -------------------------------------------- | --------------------------------------------------------------- |
| `ssh-keygen -t ed25519 -C "you@example.com"` | Generate an SSH key pair for GitHub                             |
| `eval "$(ssh-agent -s)"`                     | Start SSH agent                                                 |
| `ssh-add ~/.ssh/id_ed25519`                  | Add key to SSH agent                                            |
| Copy `~/.ssh/id_ed25519.pub`                 | Add this public key to **GitHub → Settings → SSH and GPG keys** |
| `ssh -T git@github.com`                      | Test connection to GitHub                                       |

---

## Creating a Local Repo and Connecting to GitHub

| Command                                              | Description                             |
| ---------------------------------------------------- | --------------------------------------- |
| `git init`                                           | Initialize a new Git repository locally |
| `git add .`                                          | Stage all files                         |
| `git commit -m "Initial commit"`                     | Commit changes                          |
| `git branch -M main`                                 | Rename branch to `main`                 |
| `git remote add origin git@github.com:user/repo.git` | Link local repo to GitHub remote        |
| `git push -u origin main`                            | Push your branch and set upstream       |

---

## Cloning and Collaborating

| Command                                  | Description                         |
| ---------------------------------------- | ----------------------------------- |
| `git clone git@github.com:user/repo.git` | Clone a repo via SSH                |
| `git pull origin main`                   | Pull latest changes                 |
| `git push origin main`                   | Push changes                        |
| `git remote -v`                          | List connected remotes              |
| `git remote set-url origin <new-url>`    | Update the URL of the origin remote |

---

## Managing Remotes

| Command                         | Description      |
| ------------------------------- | ---------------- |
| `git remote add <name> <url>`   | Add a new remote |
| `git remote remove <name>`      | Remove a remote  |
| `git remote rename <old> <new>` | Rename a remote  |

---

## Practical Tips

| Tip                                                      | Why It Matters                           |
| -------------------------------------------------------- | ---------------------------------------- |
| Always use SSH keys or GitHub CLI for secure access      | Avoids typing credentials for every push |
| Verify `.gitignore` before pushing sensitive files       | Prevents secrets from being committed    |
| Use `git pull --rebase` for cleaner history when syncing | Reduces merge commits clutter            |
| Double-check remote URLs when pushing to a new repo      | Avoids pushing to the wrong project      |
