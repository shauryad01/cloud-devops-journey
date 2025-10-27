# Week 6 — AWS EBS Cost Optimization via Lambda Automation

A fully serverless automation to **find and delete stale EBS snapshots** using AWS Lambda and Boto3, reducing cloud storage costs. No CloudFormation or extra template files needed—just a Python script, attached IAM execution role, and event schedule.

---

## **Features**

- Scans all EBS snapshots in your AWS account.
- Checks if the snapshot’s volume is missing, or not attached to any running EC2 instance.
- Deletes obsolete/orphaned snapshots automatically.
- Designed for AWS Lambda (Python 3.x, Boto3 built-in).
- Logs actions to CloudWatch for auditing and troubleshooting.
- Schedule weekly with CloudWatch Event Bridge (cron).

Folder structure:

    week-6-cost-optimization-ebs/
    ├── ebs_stale_snapshots.py
    ├── screenshots/
    └── README.md

---

## **Requirements**

- AWS account, Lambda, and EC2 access
- Deploy Lambda in a region with EBS snapshots to clean up
- IAM execution role **for Lambda** with permissions:

  - `ec2:DescribeSnapshots`
  - `ec2:DeleteSnapshot`
  - `ec2:DescribeVolumes`
  - `ec2:DescribeInstances`
  - `logs:CreateLogGroup`
  - `logs:CreateLogStream`
  - `logs:PutLogEvents`

---

## **Quick Start**

## 1. Deploy Lambda

- Copy `ebs_stale_snapshots.py` into a new Lambda function (Python 3.x runtime).
- Set up an execution role with EBS read/delete and logging permissions.
- Increase Lambda timeout if you have hundreds/thousands of snapshots.

## 2. Test Manually

- Create a test event with default/empty JSON (`{}`).
- Check CloudWatch Logs for:

  - Which snapshots were deleted
  - Error messages (e.g., missing permissions, API rate limits)

- View snapshot inventory in the EC2 → Snapshots console before and after.

## 3. Schedule Automated Cleanup

- In AWS Console → EventBridge (CloudWatch Events), create a rule (e.g., weekly):

  text

  `cron(0 4 ? * SUN *)  # Every Sunday at 4 AM UTC`

- Set Lambda function as the target.

---

## 📂 **Script Overview**

- `ebs_stale_snapshots.py`:

  - Fetches all EBS snapshots (Owner: self)
  - Compares each snapshot’s volume to running instances and existing volumes
  - Deletes if:

    - Snapshot not attached to a volume
    - Associated volume missing or has no attachments

  - Logs all actions, including deletion reasons

---

## 📊 **Logging & Troubleshooting**

- All output (`print`) statements stream to CloudWatch Logs.
- Common failures:

  - Permission errors (fix IAM role on Lambda)
  - API throttling (try smaller batches, increase timeout)

- Lambda logs deleted snapshot IDs and reasons for safe review.

---

## 💡 **What I Learned / What This Project Shows**

- Cloud cost optimization using serverless (Lambda) best practices.
- Writing safe, idempotent AWS cleanups in Python without extra infrastructure.
- Handling edge cases: volume not found, unattached, API errors.
- Managing IAM execution roles for least privilege serverless automation.
- End-to-end cloud automation with only a single Python file and scheduling!

---

## 🔗 **Useful Links**

- [AWS Lambda Docs](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)
- [Example IAM Role for Lambda](https://docs.aws.amazon.com/lambda/latest/dg/lambda-intro-execution-role.html)
- [Boto3 EC2 API Reference](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/ec2.html)
- [CloudWatch Events Scheduled Rules](https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html)
