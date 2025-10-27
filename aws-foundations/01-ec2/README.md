# 01 – EC2

Learned how to launch, configure, and manage EC2 instances from scratch — including SSH access, Apache setup with user-data, IAM role attachment, CloudWatch monitoring, and basic automation with the AWS CLI.

---

## 📌 What I Did

**Picked Region & AMI**

```
aws ec2 describe-images \
  --owners 099720109477 \
  --filters "Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*" \
  --query 'Images[*].[ImageId,Name]' \
  --region us-east-1 \
  --output table

```

- Selected **Ubuntu 22.04 LTS** AMI from the official Canonical account.
- Chose **us-east-1** as the working region.

---

**Created Key Pair**

```
aws ec2 create-key-pair \
  --key-name my-aws-key \
  --query 'KeyMaterial' \
  --region us-east-1 \
  --output text > my-aws-key.pem

chmod 400 my-aws-key.pem

```

- Created a secure SSH key to connect to instances.
- Protected private key permissions using `chmod 400`.

---

**Set Up Security Group (SSH + HTTP)**

```
MYIP=$(curl -s ifconfig.me)
aws ec2 create-security-group --group-name dev-sg --description "Dev SG"
SGID=$(aws ec2 describe-security-groups --filters Name=group-name,Values=dev-sg --query 'SecurityGroups[0].GroupId' --output text)
aws ec2 authorize-security-group-ingress --group-id $SGID --protocol tcp --port 22 --cidr ${MYIP}/32
aws ec2 authorize-security-group-ingress --group-id $SGID --protocol tcp --port 80 --cidr 0.0.0.0/0

```

- Allowed SSH from my IP only.
- Allowed HTTP traffic from anywhere for Apache testing.

---

**Created IAM Role (for EC2 → S3 Access)**

```
aws iam create-role \
  --role-name EC2S3ReadRole \
  --assume-role-policy-document file://ec2-trust.json

aws iam attach-role-policy \
  --role-name EC2S3ReadRole \
  --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess

```

- Gave EC2 permission to read S3 without using access keys.

---

**Launched EC2 Instance with Apache (User Data)**

```
USERDATA='#!/bin/bash
apt update -y
apt install -y apache2
systemctl enable apache2
systemctl start apache2
echo "Hello from EC2 $(hostname)" > /var/www/html/index.html
'

aws ec2 run-instances \
  --image-id ami-xxxxxxxxxxxx \
  --instance-type t2.micro \
  --key-name my-aws-key \
  --security-group-ids $SGID \
  --iam-instance-profile Name=EC2S3ReadRole \
  --user-data "$USERDATA" \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=dev-ec2}]' \
  --region us-east-1

```

- Automated Apache installation on launch using user-data.
- Verified via browser and curl.

---

**Verified Connectivity & Web Server**

```
INSTANCE_ID=<your-instance-id>
aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].Instances[0].PublicIpAddress' --output text
ssh -i my-aws-key.pem ubuntu@<public-ip>
curl http://<public-ip>

```

- SSH’d successfully.
- Saw Apache “Hello” message served.

---

**Debugged User Data Execution**

```
sudo cat /var/log/cloud-init-output.log
sudo systemctl status apache2

```

- Checked logs for cloud-init errors.
- Verified Apache service status.

---

**Elastic IP Setup**

```
ALLOCATION_ID=$(aws ec2 allocate-address --domain vpc --query 'AllocationId' --output text)
aws ec2 associate-address --instance-id $INSTANCE_ID --allocation-id $ALLOCATION_ID

```

- Reserved a static IP for consistent SSH/web access.

---

**EBS Volume**

```
aws ec2 create-volume --size 10 --availability-zone us-east-1a --volume-type gp3
aws ec2 attach-volume --volume-id vol-xxxx --instance-id $INSTANCE_ID --device /dev/sdf

```

- Attached extra storage, formatted, and mounted inside instance.

---

**Enabled CloudWatch Monitoring + Alarm**

```
aws ec2 monitor-instances --instance-ids $INSTANCE_ID
aws cloudwatch put-metric-alarm \
  --alarm-name HighCPU \
  --metric-name CPUUtilization \
  --namespace AWS/EC2 \
  --statistic Average \
  --period 300 \
  --threshold 70 \
  --comparison-operator GreaterThanThreshold \
  --dimensions Name=InstanceId,Value=$INSTANCE_ID \
  --evaluation-periods 1

```

- Enabled detailed monitoring.
- Created an alarm for CPU > 70%.

---

**Tagged & Cleaned Up Resources**

```
aws ec2 create-tags --resources $INSTANCE_ID --tags Key=Owner,Value=shaurya Key=Project,Value=boto3-demo
aws ec2 terminate-instances --instance-ids $INSTANCE_ID
aws ec2 release-address --allocation-id $ALLOCATION_ID
aws cloudwatch delete-alarms --alarm-names HighCPU

```

- Tagged for ownership & cost control.
- Cleaned up all resources safely.

---

## 📝 Why This Matters

- **Core Infrastructure Skill:** EC2 is the foundation for all AWS compute.
- **Automation Ready:** You learn how to bootstrap servers programmatically.
- **Security Awareness:** IAM roles and proper SSH/IP rules prevent breaches.
- **Monitoring Mindset:** CloudWatch adds visibility and alerting early on.

---

## 🔗 Useful Links

- [AWS EC2 User Guide](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html)
- [Amazon Linux & Ubuntu AMIs](https://cloud-images.ubuntu.com/locator/)
- [AWS CLI EC2 Reference](https://docs.aws.amazon.com/cli/latest/reference/ec2/index.html)
- [CloudWatch Metrics Reference](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html)
