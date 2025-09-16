# Cheatsheet: 17 – Security Basics (Firewall & Ports)

---

## Port & Service Discovery

| Command               | Description                                | Common Switches / Examples                             |
| --------------------- | ------------------------------------------ | ------------------------------------------------------ |
| `ss -tuln`            | Show listening TCP/UDP ports and addresses | `-t` TCP, `-u` UDP, `-l` listening, `-n` numeric ports |
| `sudo netstat -tulnp` | Show listening ports with process info     | `-p` show PID/program name                             |
| `sudo lsof -i :22`    | Find which process owns port 22            | —                                                      |
| `sudo fuser 80/tcp`   | Show process using port 80                 | —                                                      |
| `nmap localhost`      | Scan localhost for open ports              | `-p 1-1024 localhost` scan port range                  |

---

## UFW (Uncomplicated Firewall) – Ubuntu/Debian

| Command                                                       | Description                    | Common Switches / Examples |
| ------------------------------------------------------------- | ------------------------------ | -------------------------- |
| `sudo ufw status verbose`                                     | Show firewall status and rules | —                          |
| `sudo ufw enable`                                             | Enable UFW                     | —                          |
| `sudo ufw disable`                                            | Disable UFW                    | —                          |
| `sudo ufw reset`                                              | Reset UFW to defaults          | —                          |
| `sudo ufw allow 22/tcp`                                       | Allow SSH traffic              | —                          |
| `sudo ufw allow 80/tcp`                                       | Allow HTTP traffic             | —                          |
| `sudo ufw deny 23/tcp`                                        | Deny Telnet traffic            | —                          |
| `sudo ufw delete allow 80/tcp`                                | Remove HTTP rule               | —                          |
| `sudo ufw allow from 192.168.1.50 to any port 8080 proto tcp` | Allow specific IP on port 8080 | —                          |
| `sudo ufw allow 3000:4000/tcp`                                | Allow port range 3000–4000     | —                          |

---

## firewalld – CentOS/RHEL/Fedora

| Command                                                                                                | Description                            | Common Switches / Examples |
| ------------------------------------------------------------------------------------------------------ | -------------------------------------- | -------------------------- |
| `sudo systemctl status firewalld`                                                                      | Check firewalld service status         | —                          |
| `sudo firewall-cmd --state`                                                                            | Show if firewalld is running           | —                          |
| `sudo firewall-cmd --list-all`                                                                         | List current zone and allowed services | —                          |
| `sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent`                                      | Allow port 8080 permanently            | —                          |
| `sudo firewall-cmd --reload`                                                                           | Reload rules after changes             | —                          |
| `sudo firewall-cmd --get-active-zones`                                                                 | View active zones                      | —                          |
| `sudo firewall-cmd --zone=home --list-services`                                                        | List allowed services in “home” zone   | —                          |
| `sudo firewall-cmd --zone=public --add-service=ssh --permanent`                                        | Allow SSH service                      | —                          |
| `sudo firewall-cmd --zone=public --add-rich='rule family="ipv4" source address="192.168.52.1" reject'` | Block traffic from specific IP         | —                          |

---

## iptables Basics

| Command                                                                | Description                        | Common Switches / Examples                                                                                       |
| ---------------------------------------------------------------------- | ---------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `sudo iptables -L -v`                                                  | List all firewall rules (verbose)  | —                                                                                                                |
| `sudo iptables -A INPUT -p icmp -j ACCEPT`                             | Allow incoming ICMP (ping) traffic | —                                                                                                                |
| `sudo iptables -A INPUT -s 192.168.160.51 -p tcp --dport 22 -j ACCEPT` | Allow SSH from specific IP         | —                                                                                                                |
| `sudo iptables -A INPUT -p tcp --dport 8080 -j ACCEPT`                 | Allow HTTP on port 8080            | —                                                                                                                |
| `sudo iptables -A INPUT -p tcp --dport 23 -j DROP`                     | Block Telnet on port 23            | —                                                                                                                |
| `sudo iptables -F`                                                     | Flush/reset all rules              | —                                                                                                                |
| **Common options**                                                     |                                    | `-C` check, `-D` delete, `-I` insert, `-N` new chain, `-X` delete chain, `-p` protocol, `-s` source, `-j` action |

---

## Testing & Verification

| Command                               | Description                                             | Common Switches / Examples |
| ------------------------------------- | ------------------------------------------------------- | -------------------------- |
| `systemctl list-units --type=service` | List running services                                   | —                          |
| `nc -zv localhost 22`                 | Test connection to SSH port (should pass)               | —                          |
| `nc -zv localhost 23`                 | Test connection to Telnet port (should fail if blocked) | —                          |
