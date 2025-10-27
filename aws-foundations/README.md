# AWS-Foundations

This folder marks where I moved from local automation to cloud infrastructure — learning how to actually **launch, secure, and automate AWS resources**.

I didn’t just click through the console; I broke things on EC2, tried fixing IAM permissions, and automated everything using Python’s `boto3`. The goal wasn’t memorization — it was understanding how each AWS service interacts, and how to control it programmatically.

Each subfolder explores one core AWS building block — the foundations you need before Terraform, Jenkins, or Ansible make sense.

---

## 🗂️ What’s in here

**01-ec2/**  
Launched and managed EC2 instances manually and via Boto3.  
Configured Apache using user-data, assigned Elastic IP, tested security groups, and explored CloudWatch metrics.

**02-s3/**  
Created buckets, uploaded files, set access permissions, and integrated S3 objects with web apps hosted on EC2.

**03-iam/**  
Worked with IAM users, groups, and custom policies. Practiced least-privilege design and used roles to connect EC2 and S3 securely.

**04-cloudwatch/**  
Monitored EC2 metrics, created CPU alarms, and experimented with log groups and custom metrics via Boto3.

**05-boto3-automation/**  
Python scripts to automate EC2 launch, Apache setup, S3 upload, IAM user creation, and CloudWatch alarm creation — my first step toward true Infrastructure-as-Code.

**06-lambda-functions/**  
Created serverless automation using AWS Lambda and Boto3 to clean up stale EBS snapshots and trigger actions from S3 events.

---

## 💡 Why It Matters

Before you dive into Terraform or Jenkins pipelines, you need to understand what they’re automating. This directory is that base layer — **manual → scripted → serverless**.

I learned how IAM permissions affect EC2 and S3 automation, what happens when CloudWatch alarms misfire, and how small mistakes (like a wrong key pair) can break everything.

---

### 🧰 Tools Used

- AWS Console & CLI
- Boto3 (Python SDK)
- IAM Roles & Policies
- CloudWatch Metrics & Alarms

- Lambda Functions

---

## 📚 Resources I Used

- AWS Documentation (official, service-specific guides)
- GeeksforGeeks blogs
- [Youtube playlist: AWS- Abhishek Veeramalla](https://youtube.com/playlist?list=PLdpzxOOAlwvLNOxX0RfndiYSt1Le9azze&si=P-9OOrzA9tfUNXXp)
- Boto3 API Reference ([https://boto3.amazonaws.com/v1/documentation/api/latest/index.html](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html))

---

## 🤝 Follow Along

**GitHub:** [@shauryad01](https://github.com/shauryad01)  
**LinkedIn:** [Shaurya Dhingra](https://linkedin.com/in/shauryadhingra)  
**Docs / Blog:** [Hashnode](https://shauryad01.hashnode.dev/)

---
