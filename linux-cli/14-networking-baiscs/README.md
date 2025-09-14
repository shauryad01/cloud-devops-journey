# 14 – Networking Basics

Covered essential Linux networking concepts and commands — from IP addresses and subnets to ports, DNS, TCP handshakes, and file transfer utilities (SCP, SFTP, rsync, wget, curl). Also explored how networking ties into DevOps by testing connectivity on AWS EC2 instances.

## 📌 **What I Did**

### IP Addressing & Interfaces

- `ip a` — checked IPv4 + IPv6 addresses, loopback vs public/private IP.
- `ping -c 3 127.0.0.1` — tested loopback.
- `ping -c 3 <EC2-public-ip>` — confirmed external connectivity.

### Subnets & Routing

- Looked at AWS VPC subnet CIDR (`172.31.0.0/16`) and confirmed EC2 IP falls inside.
- `ip route` — viewed default route (`0.0.0.0/0` via Internet Gateway).

### Ports & Services

- Installed Nginx → verified with:

  - `ss -tulnp | grep 80` — Nginx listening on port 80.
  - `curl -I http://localhost` → confirmed local response.
  - `curl -I http://<EC2-public-ip>` → external response.

### DNS Resolution

- `dig google.com` / `nslookup github.com` — resolved A records.
- `ping google.com` — confirmed DNS + connectivity.

### TCP Handshake

- `curl -v http://<EC2-ip>` → verbose output showing TCP 3-way handshake + HTTP response.
- `tcpdump -i any port 80 -c 5` — captured SYN, SYN-ACK, ACK packets.

### OSI & TCP/IP Model Mapping

- L3 (Network): IP connectivity with `ping`.
- L4 (Transport): TCP handshake via `curl -v`.
- L7 (Application): HTTP served by Nginx.

### File Transfer Utilities

- **SCP** — `scp -i aws-key.pem local.txt ubuntu@<EC2>:~/`
- **SFTP** — `sftp -i aws-key.pem ubuntu@<EC2>` → `put`, `get`, `ls`.
- **rsync** — `rsync -avz -e "ssh -i aws-key.pem" ./dir ubuntu@<EC2>:~/remote-dir/`.
- **wget** — `wget https://example.com/file.zip`.
- **curl** — `curl -O https://example.com/file.zip`.

### Extra Protocols

- **Ethernet/MAC** — `ip link show` or `cat /sys/class/net/eth0/address`.
- **ARP** — `arp -a` or `ip neigh show` to see IP–MAC mappings.
- **DHCP** — checked lease at `/var/lib/dhcp/dhclient.leases`, renewed with `sudo dhclient -v`.

## 📝 **Why This Matters**

- Networking is the backbone of **Cloud & DevOps** — from SSH access to EC2, to exposing apps via Nginx, to secure file transfers.
- Tools like `dig`, `traceroute`, and `ss` help troubleshoot real-world issues quickly.
- Understanding OSI layers makes debugging structured instead of guesswork.
- Knowing SCP, SFTP, and rsync is vital for automation, backups, and deployments.

## 🔗 **Useful Links**

- [Linux Networking Commands](https://linux.die.net/man/)
- [AWS VPC & Subnets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html)
- [nginx Docs](https://nginx.org/en/docs/)

- [Computer Networking For DevOps- TrainWithShubham](https://www.youtube.com/live/mNTs-shuFno?si=1-n4-vt-sUWjS8Nw)
