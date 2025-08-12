# Cheatsheet: 01-Setting-Up-EC2

## 1. Connecting to EC2 Instance
| Command | Description | Notes |
| ------- | ----------- | ----- |
| `ssh -i <key>.pem ubuntu@<public-ip>` | Connect to EC2 instance | Replace `<key>.pem` with your key file and `<public-ip>` with EC2's public IP |
| `chmod 400 <key>.pem` | Restrict permissions for private key | Required before using the key with SSH |

---

## 2. Basic System Info
| Command | Description | Notes |
| ------- | ----------- | ----- |
| `uname -a` | Show kernel and OS info | |
| `lsb_release -a` | Show Ubuntu release details | |
| `hostname` | Show system hostname | |
| `whoami` | Show current logged-in user | |
| `uptime` | Show system uptime and load average | |

---

## 3. Basic Network Commands
| Command | Description | Notes |
| ------- | ----------- | ----- |
| `ping <host>` | Test connectivity | |
| `curl <url>` | Fetch data from a URL | |
| `wget <url>` | Download file from URL | |
| `ifconfig` or `ip addr` | Show network interfaces | Install `net-tools` for `ifconfig` |
