# 17 – Security Basics (Firewall & Ports)

Covered the fundamentals of discovering open ports and controlling inbound/outbound traffic on Linux systems. Explored `ss`, `lsof`, and `nmap` to inspect listening services, used UFW and firewalld for firewall management, and practiced basic iptables operations. These are critical to protect servers, limit attack surfaces, and troubleshoot connectivity issues.

---

## 📌 What I Did

### Port & Service Discovery

Checked listening ports and owning processes:

```
ss -tuln                     # show TCP/UDP listeners (numeric)
sudo netstat -tulnp          # legacy port/service info
sudo lsof -i :22             # see process using port 22 (SSH)
sudo fuser 80/tcp            # find process using port 80
```

Scanned local machine for open ports:

```
sudo apt install nmap        # install Nmap
nmap localhost               # scan localhost
nmap -p 1-1024 localhost     # scan all well-known ports
```

---

### UFW (Uncomplicated Firewall)

Verified and configured firewall rules on Ubuntu/Debian:

```
sudo ufw status verbose
sudo ufw enable
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw deny 23/tcp
sudo ufw delete allow 80/tcp
sudo ufw allow from 192.168.1.50 to any port 8080 proto tcp
sudo ufw allow 3000:4000/tcp
sudo ufw disable
sudo ufw reset
```

---

### firewalld (CentOS/RHEL/Fedora)

Managed firewalld zones and ports:

```
sudo systemctl status firewalld
sudo firewall-cmd --state
sudo firewall-cmd --list-all
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --get-active-zones
sudo firewall-cmd --zone=home --list-services
```

Allowed SSH service and blocked specific IP addresses:

```
sudo firewall-cmd --zone=public --add-service=ssh --permanent
sudo firewall-cmd --zone=public --add-rich='rule family="ipv4" source address="192.168.52.1" reject'
sudo firewall-cmd --reload
```

---

### iptables Basics

Configured packet filtering rules directly:

```
sudo iptables -L -v
sudo iptables -A INPUT -p icmp -j ACCEPT          # allow ping
sudo iptables -A INPUT -s 192.168.160.51 -p tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 23 -j DROP
sudo iptables -F                                  # flush/reset all rules
```

Reviewed table and chain concepts (`filter`, `nat`, `mangle`, etc.) and common policies (`DROP`, `ACCEPT`, `REJECT`).

---

### Testing & Verification

Validated firewall behavior and running services:

```
systemctl list-units --type=service
nc -zv localhost 22
nc -zv localhost 23
```

---

## 📝 Why This Matters

- **Firewalls** are the first line of defense against unauthorized access.
- **Port scanning and service checks** help identify vulnerabilities and exposed applications.
- **UFW and firewalld** make firewall management more accessible; **iptables** gives fine-grained control.
- Correct rules prevent exposing sensitive services and are essential for troubleshooting connectivity.

---

## 🔗 Useful Links

- [GeeksforGeeks – Introduction to Ports](https://www.geeksforgeeks.org/computer-organization-architecture/introduction-of-ports-in-computers/)
- [GeeksforGeeks – Introduction to Subnetting](https://www.geeksforgeeks.org/computer-networks/introduction-to-subnetting/)
- [GeeksforGeeks – iptables Command in Linux](https://www.geeksforgeeks.org/linux-unix/iptables-command-in-linux-with-examples/)
- [Linux Man Pages – firewalld](https://man7.org/linux/man-pages/man1/firewalld.1.html)
- [GeeksforGeeks – SSH Keys](https://www.geeksforgeeks.org/computer-networks/introduction-to-ssh-secure-shell-keys/)

```

```
