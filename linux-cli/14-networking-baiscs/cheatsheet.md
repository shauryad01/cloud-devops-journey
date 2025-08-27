# Cheatsheet: 14 – Networking Basics

---

## **IP Addressing & Interfaces**

| Command       | Description                       | Common Switches / Examples |
| ------------- | --------------------------------- | -------------------------- |
| `ip a`        | Show all network interfaces & IPs | `ip a`                     |
| `ifconfig`    | Legacy command for interface info | `ifconfig eth0`            |
| `ping <host>` | Test connectivity using ICMP      | `ping -c 4 google.com`     |
| `hostname -I` | Show system’s IP addresses        | —                          |

---

## **Routing & Subnets**

| Command             | Description                               | Common Switches / Examples |
| ------------------- | ----------------------------------------- | -------------------------- |
| `ip route`          | Show routing table (default gateway etc.) | `ip route show`            |
| `netstat -rn`       | Show kernel routing table (legacy)        | —                          |
| `traceroute <host>` | Show hops to destination                  | `traceroute google.com`    |

---

## **Ports & Services**

| Command                | Description                       | Common Switches / Examples |           |
| ---------------------- | --------------------------------- | -------------------------- | --------- |
| `ss -tulnp`            | Show open TCP/UDP sockets         | \`ss -tulnp                | grep 80\` |
| `netstat -tulnp`       | Legacy command for ports/services | —                          |           |
| `curl -I http://<ip>`  | Test HTTP response headers        | `curl -I http://127.0.0.1` |           |
| `nc -zv <host> <port>` | Check if port is open             | `nc -zv localhost 22`      |           |

---

## **DNS & Name Resolution**

| Command           | Description                             | Common Switches / Examples |
| ----------------- | --------------------------------------- | -------------------------- |
| `nslookup <host>` | Resolve domain to IP (basic)            | `nslookup github.com`      |
| `dig <host>`      | Detailed DNS query (A, MX, CNAME, etc.) | `dig google.com ANY`       |
| `ping <host>`     | Confirms DNS resolution + connectivity  | `ping google.com`          |

---

## **TCP / Handshake Debugging**

| Command                  | Description                          | Common Switches / Examples          |
| ------------------------ | ------------------------------------ | ----------------------------------- |
| `curl -v <url>`          | Verbose output showing TCP handshake | `curl -v http://example.com`        |
| `tcpdump -i any port 80` | Capture packets on port 80           | `sudo tcpdump -i eth0 port 80 -c 5` |

---

## **File Transfer**

| Command                                                 | Description                   | Common Switches / Examples                         |
| ------------------------------------------------------- | ----------------------------- | -------------------------------------------------- |
| `scp -i key.pem file user@host:/path/`                  | Secure copy to remote         | `scp -i aws.pem notes.txt ubuntu@IP:/home/ubuntu/` |
| `sftp -i key.pem user@host`                             | Interactive file transfer     | `put file.txt`, `get file.txt`                     |
| `rsync -avz -e "ssh -i key.pem" ./dir user@host:/path/` | Sync files (fast + resumable) | —                                                  |
| `wget <url>`                                            | Download file from web        | `wget https://example.com/file.zip`                |
| `curl -O <url>`                                         | Download file (output saved)  | `curl -O https://example.com/file.zip`             |

---

## **Ethernet, ARP & DHCP**

| Command                           | Description                       | Common Switches / Examples |
| --------------------------------- | --------------------------------- | -------------------------- |
| `ip link show`                    | Show interfaces + MAC addresses   | —                          |
| `cat /sys/class/net/eth0/address` | Show MAC address                  | —                          |
| `arp -a` / `ip neigh show`        | Show ARP table (IP ↔ MAC mapping) | —                          |
| `sudo dhclient -v`                | Request new IP from DHCP server   | —                          |

---

## **OSI & TCP/IP Models (Mapping)**

| Layer          | Example Command / Tool        |
| -------------- | ----------------------------- |
| L1 – Physical  | `ip link show` (Ethernet up?) |
| L2 – Data Link | `arp -a` (MAC ↔ IP mapping)   |
| L3 – Network   | `ping`, `traceroute`          |
| L4 – Transport | `nc`, `ss -tulnp`             |
| L7 – App       | `curl`, Nginx, wget           |
