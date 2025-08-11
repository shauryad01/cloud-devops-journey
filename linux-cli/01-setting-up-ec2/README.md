# 01-setting-up-ec2

Set up an **AWS EC2 instance** to use as my remote Linux environment for Week 1 of the Linux CLI journey.

---

## 📌 What I Did

1. **Created an AWS Account**

   - Purpose: Get real cloud experience beyond local VMs.
   - Action: Signed up for AWS Free Tier.

2. **Set Up Billing Alerts**

   - Purpose: Prevent unexpected charges.
   - AWS Service: **CloudWatch Billing Alarms**.
   - Configured to notify me if costs go above $0.

3. **Launched an EC2 Instance**

   ```bash
   # From AWS Management Console (no CLI used for launch in this step)
   ```

   - AMI: Ubuntu Server (Free Tier eligible)
   - Instance Type: `t2.micro` (Free Tier)
   - Purpose: Cloud-hosted Linux server for practice.

4. **Generated and Configured SSH Keys**

   ```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   eval "$(ssh-agent -s)"
   ssh-add ~/.ssh/id_rsa
   cat ~/.ssh/id_rsa.pub
   ```

   - Purpose: Enable secure, password-less connection.

5. **Connected to EC2 via SSH**

   ```bash
   ssh -i my-key.pem ubuntu@<public-ip>
   ```

   - `-i my-key.pem` → Specify the private key.
   - `ubuntu` → Default user for Ubuntu AMI.
   - `<public-ip>` → Found in the EC2 instance details.
   - Purpose: Access remote shell.

6. **Checked Connection and System Info**
   ```bash
   whoami       # Shows logged-in user
   uname -a     # Kernel & system details
   hostname     # Server hostname
   uptime       # System uptime and load average
   ```
   - Purpose: Confirmed I was connected to the correct instance and verified system status.

---

## 🔗 Useful Links

- [AWS EC2 Getting Started Guide](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html)
- [Connecting to Your Linux Instance Using SSH](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstancesLinux.html)
