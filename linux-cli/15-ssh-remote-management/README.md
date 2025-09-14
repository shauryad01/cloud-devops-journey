# 15-ssh-remote-mgmt

Learned how to securely connect, manage, and transfer files between systems using SSH. Covered basics, authentication, configuration, and advanced usage (tunneling, ssh-agent, multiplexing).

---

## 📌 What I Did

**Basics**  
Installed and verified SSH:

```
ssh -V
sudo systemctl start ssh
sudo systemctl enable ssh
sudo systemctl status ssh
```

Connected to localhost and remote systems:

```
ssh user@localhost
ssh user@remote-ip
ssh -p 2222 user@host   # custom port
```

---

**Authentication**  
Generated SSH keys:

```
ssh-keygen -t rsa -b 4096
```

Copied public key to server:

```
ssh-copy-id user@server
```

Logged in without password prompt using key-based authentication.

---

**Configuration**  
Edited `/etc/ssh/sshd_config`:

- Changed port to 2222.
- Disabled root login (PermitRootLogin no).
- Disabled password authentication (PasswordAuthentication no).

Restarted SSH service:

```
sudo systemctl restart ssh
```

---

**Advanced Usage**  
Created `~/.ssh/config` for aliases (shortcut: `ssh my-ec2`).

Port forwarding (examples):

```
ssh -L 8080:localhost:80 user@remote   # local forwarding
ssh -R 9090:localhost:22 user@remote   # remote forwarding
```

Used `ssh-agent` and `ssh-add` to manage keys.

Enabled multiplexing for faster repeated connections:

```
ControlMaster auto
ControlPath ~/.ssh/sockets/%r@%h-%p
ControlPersist 10m
```

---

## 📝 Why This Matters

- SSH is the default way to manage Linux servers in DevOps and Cloud.
- Key-based authentication = stronger security, no password reuse.
- Config changes (port, disabling root) = reduce attack surface.
- Advanced tricks (aliases, forwarding, multiplexing) make remote work faster and more reliable.
- Real-world relevance: logging into AWS EC2, bastion hosts, and managing remote infrastructure.

---

## 🔗 Useful Links

- [OpenSSH Official Site](https://www.openssh.com/)
- [SSH Config Documentation](https://www.ssh.com/academy/ssh/config)
- [SSH Hardening Guide](https://stribika.github.io/2015/01/04/secure-secure-shell.html)
