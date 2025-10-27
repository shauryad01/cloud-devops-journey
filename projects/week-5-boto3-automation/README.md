# Week 5 — AWS Infrastructure Automation with Python & Boto3

An automation suite for **provisioning EC2 servers**, **configuring Apache**, **managing S3 buckets/objects**, **setting up IAM users/policies**, and **deploying CloudWatch alarms**.  
Built using **Python (Boto3)**, modular scripts, and AWS CLI.

---

## **Features**

- Launches a clean EC2 instance and installs Apache with custom HTML.
- Creates and manages S3 buckets, uploads files, sets public access.
- Defines IAM users, groups, policies, and attaches permissions.
- Enables CloudWatch monitoring and sets up utilization alarms.
- Modular Python scripts for each AWS service.
- End-to-end automation handled by a single orchestrator script:

      week-5-boto3-automation
      ├── screenshots/
      │   ├── all_users.png
      │   ├── automation_active.png
      │   ├── automation_code.png
      │   ├── cloudwatch_in_alarm.png
      │   ├── cloudwatch_manager_code.png
      │   ├── created_bucket.png
      │   ├── deployed_apache_server.png
      │   ├── ec2_manager_code.png
      │   ├── iam_manager_code.png
      │   ├── launched_instance.png
      │   └── s3_manager_code.png
      ├── scripts/
      │   ├── automation.py
      │   ├── cloudwatch_manager.py
      │   ├── cpu_spike.py
      │   ├── ec2_manager.py
      │   ├── iam_manager.py
      │   └── s3_manager.py
      ├── README.md
      ├── requirements.txt

---

## **Requirements**

- AWS account (Free Tier or above)
- Python 3.x (tested on Ubuntu)
- pip, virtualenv (recommended)
- AWS CLI installed & `aws configure` run
- IAM credentials/role with permissions for EC2, S3, IAM, CloudWatch

---

## **Quick Start**

## Install Python Packages

    python3 -m venv venv source venv/bin/activate pip install -r requirements.txt

## Configure AWS Credentials

    aws configure

or provide credentials as environment variables or profile.

## Run Full Workflow

    python scripts/automation.py

You can also modify individual modules:

    python scripts/ec2_manager.py
    python scripts/s3_manager.py

---

## 📂 **Scripts Overview**

- `ec2_manager.py` → Launches EC2, manages Apache setup, fetches public IP.
- `s3_manager.py` → Creates S3 bucket, uploads test files/images.
- `iam_manager.py` → Automates user, group, policy creation and assignment.
- `cloudwatch_manager.py` → Fetches monitoring stats, sets alarms.
- `automation.py` → Orchestrates end-to-end: all services, all validation.

---

## 📊 **Monitoring & Validation**

- All key resource IDs and public endpoints output to terminal and written to logs.
- Screenshots folder includes EC2, S3, policy, and monitoring dashboards.
- Manual checks: SSH to EC2, curl Apache, browse S3 asset URLs.

---

## 💡 **What I Learned / What This Project Shows**

- Building modular automation in Python using Boto3 and AWS API.
- Encoding least-privilege IAM as code, not console clicks.
- End-to-end Infrastructure-as-Code without third-party frameworks.
- Debugging service dependencies: waiting for EC2 readiness, public IP, IAM propagation.
- Handling AWS Free Tier, cleanup, permissions errors, and script idempotency.

---

## 🔗 **Useful Links**

- [Boto3 Documentation](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html)
- [AWS EC2 Boto3 API](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/ec2.html)
- [AWS S3 Boto3 API](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/s3.html)
- [AWS IAM Boto3 API](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/iam.html)
- [CloudWatch Boto3 API](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/cloudwatch.html)
