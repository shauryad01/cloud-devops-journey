# Cheatsheet: 15 – SSH and Remote Management

---

## Basics

| Command                   | Description                      | Example                           |
| ------------------------- | -------------------------------- | --------------------------------- |
| `ssh user@host`           | Connect to a remote host via SSH | `ssh ubuntu@192.168.1.10`         |
| `ssh -p <port> user@host` | Connect on a custom port         | `ssh -p 2222 ubuntu@192.168.1.10` |
| `ssh -V`                  | Show SSH client version          | —                                 |
| `systemctl start ssh`     | Start SSH service (server-side)  | `sudo systemctl start ssh`        |
| `systemctl status ssh`    | Check SSH service status         | `sudo systemctl status ssh`       |

---

## Authentication

| Command                                    | Description                                  | Example                                     |
| ------------------------------------------ | -------------------------------------------- | ------------------------------------------- |
| `ssh-keygen -t rsa -b 4096`                | Generate SSH key pair                        | `ssh-keygen -t ed25519`                     |
| `ssh-copy-id user@server`                  | Copy public key to server (simplifies login) | `ssh-copy-id ubuntu@myserver`               |
| `cat id_rsa.pub >> ~/.ssh/authorized_keys` | Manually add public key to server            | —                                           |
| `ssh -i key.pem user@host`                 | Use a specific private key file              | `ssh -i ~/.ssh/mykey.pem ec2-user@aws-host` |

---

## SSH Config File (`~/.ssh/config`)

| Option         | Description           | Example                                             |
| -------------- | --------------------- | --------------------------------------------------- |
| `Host alias`   | Define shortcut name  | `Host my-ec2`                                       |
| `HostName`     | Remote server address | `HostName ec2-3-95-136-121.compute-1.amazonaws.com` |
| `User`         | Default username      | `User ubuntu`                                       |
| `IdentityFile` | Path to private key   | `IdentityFile ~/.ssh/mykey.pem`                     |

Connect using: `ssh my-ec2`

---

## File Transfer

| Command                           | Description                             | Example                                        |
| --------------------------------- | --------------------------------------- | ---------------------------------------------- |
| `scp file user@host:/path/`       | Copy local file to remote               | `scp notes.txt ubuntu@server:/home/ubuntu/`    |
| `scp user@host:/path/file .`      | Copy remote file to local               | `scp ubuntu@server:/etc/hosts ./`              |
| `rsync -avz file user@host:/path` | Sync files (preferred over scp)         | `rsync -avz ./site ubuntu@server:/var/www/`    |
| `sftp user@host`                  | Start interactive file transfer session | `sftp ubuntu@server` → `put file` / `get file` |

---

## Port Forwarding & Tunneling

| Command                                | Description                        | Example                                  |
| -------------------------------------- | ---------------------------------- | ---------------------------------------- |
| `ssh -L 8080:localhost:80 user@remote` | Local forwarding (local → remote)  | Forward local port 8080 → remote port 80 |
| `ssh -R 9090:localhost:22 user@remote` | Remote forwarding (remote → local) | Expose local SSH on remote port 9090     |
| `ssh -D 1080 user@remote`              | Dynamic forwarding (SOCKS proxy)   | Use as lightweight VPN                   |
| `ssh -J user@jump host@target`         | Jump/Bastion host                  | `ssh -J bastion@host target@internal`    |

---

## Key Management & ssh-agent

| Command                  | Description                 | Example |
| ------------------------ | --------------------------- | ------- |
| `eval "$(ssh-agent -s)"` | Start ssh-agent session     | —       |
| `ssh-add ~/.ssh/id_rsa`  | Add private key to agent    | —       |
| `ssh-add -l`             | List keys loaded into agent | —       |

---

## Multiplexing (Speeding Up Multiple Connections)

Add to `~/.ssh/config`:

```
Host *
  ControlMaster auto
  ControlPath ~/.ssh/control-%r@%h:%p
  ControlPersist 10m
```

- Reuses a single SSH connection → faster multiple logins.
- ControlPersist keeps session alive for X minutes.

---

## Hardening & Security

| Config (`/etc/ssh/sshd_config`) | Purpose                           |
| ------------------------------- | --------------------------------- |
| `Port 2222`                     | Change SSH port (avoid 22)        |
| `PermitRootLogin no`            | Disable root login                |
| `PasswordAuthentication no`     | Force key-only login              |
| `MaxAuthTries 3`                | Limit login attempts              |
| `AllowUsers user1 user2`        | Restrict allowed SSH users        |
| `ClientAliveInterval 300`       | Disconnect idle sessions (5 mins) |

Restart after changes:

```
sudo systemctl restart ssh
```

---

## Troubleshooting

| Error / Symptom               | Likely Cause                               | Fix                                      |
| ----------------------------- | ------------------------------------------ | ---------------------------------------- |
| Connection refused            | SSH service not running / firewall blocked | `sudo systemctl start ssh` + check `ufw` |
| Permission denied (publickey) | Wrong key or not added to authorized_keys  | Re-add key, check file permissions       |
| Host key verification failed  | Changed/reinstalled server                 | `ssh-keygen -R <host>`                   |
| Too open permissions          | `~/.ssh` perms too loose                   | `chmod 700 ~/.ssh && chmod 600 id_rsa`   |

---

## Logs & Debugging

| Command                     | Purpose                        |
| --------------------------- | ------------------------------ |
| `ssh -v user@host`          | Verbose debug output           |
| `ssh -vvv user@host`        | Extra detailed debug           |
| `journalctl -u ssh`         | View SSH server logs (systemd) |
| `tail -f /var/log/auth.log` | Watch auth logs in real-time   |

---

## Real-World Use

| Task                            | Command Example                                                     |
| ------------------------------- | ------------------------------------------------------------------- |
| Connect to AWS EC2              | `ssh -i mykey.pem ec2-user@ec2-54-12-34-56.compute-1.amazonaws.com` |
| Use Bastion host                | `ssh -J user@bastion user@internal`                                 |
| Expose local webserver remotely | `ssh -R 9090:localhost:8080 user@remote` (access via remote:9090)   |
| Backup with rsync               | `rsync -avz -e ssh ./data user@remote:/backup`                      |
