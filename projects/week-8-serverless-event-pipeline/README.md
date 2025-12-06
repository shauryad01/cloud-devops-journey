# **Week 8 — AWS Serverless Event Pipeline (S3 → Lambda → DynamoDB → SNS)**

A fully serverless, event-driven automation pipeline built using **Terraform**, integrating **S3, Lambda, DynamoDB, SNS, and CloudWatch**.  
This project focuses on wiring AWS services together to react to real events — specifically, file uploads — and process them automatically with no servers involved.

Everything is deployed through Terraform, including IAM roles, Lambda packaging, triggers, environment variables, tables, and log groups.

This week centered on building **real backend automation** using serverless patterns.

---

## **Features**

- End-to-end event pipeline:

  - **S3** bucket receives file uploads
  - **Lambda** is triggered automatically
  - Lambda extracts metadata and writes it to
  - **DynamoDB** table
  - Lambda sends notifications using
  - **SNS Email Alerts**
  - All execution logs stored in **CloudWatch**

- Infrastructure created entirely via Terraform:

  - Lambda packaging using `archive_file`
  - IAM roles + least-privilege policies
  - S3 → Lambda event triggers
  - CloudWatch log groups with retention
  - Automatic environment variables for Lambda

- Clean, modular Terraform structure
- Idempotent re-deployments
- Ready for extension (Kinesis, Step Functions, API Gateway)

---

## **Folder Structure**

```
week-8-serverless-event-pipeline/
├── lambda/
│   └── index.py
├── cloudwatch.tf
├── dynamodb.tf
├── iam.tf
├── lambda.tf
├── providers.tf
├── s3.tf
├── s3_notifications.tf
├── sns.tf
├── variables.tf
└── README.md

```

---

## **Requirements**

- AWS account
- Terraform installed (v1.0+)
- AWS CLI configured
- IAM permissions for:

  - Lambda
  - S3
  - DynamoDB
  - SNS
  - CloudWatch Logs

---

## **Quick Start**

### **1. Initialize Terraform**

    terraform init

---

### **2. Deploy the Pipeline**

```bash
terraform apply

```

Terraform provisions:

- S3 bucket
- DynamoDB table
- Lambda function (zip built automatically via `archive_file`)
- IAM roles and policy attachments
- SNS topic + subscription
- CloudWatch log group
- S3 event → Lambda trigger routing

---

### **3. Test the Pipeline**

1.  Upload any file to the S3 bucket
2.  Lambda is triggered instantly
3.  Check DynamoDB — new item appears
4.  Check email — SNS notification is delivered
5.  View CloudWatch logs for Lambda execution details

---

## **Module & Component Overview**

### **Lambda Module**

- Packages Python code using Terraform
- Handles:

  - S3 event parsing
  - DynamoDB writes
  - SNS notifications
  - Logging

**Minimal handler:**

```python
file = record['s3']['object']['key']
table.put_item({"file_name": file})

```

---

### **S3 Module**

- Creates bucket with proper naming & tags
- Configures S3 → Lambda notifications

---

### **DynamoDB Module**

- Table with a partition key: `file_name`
- PAY_PER_REQUEST billing for low-cost usage

---

### **SNS Module**

- Topic for upload alerts
- Email subscription for notifications

---

### **IAM Module**

Defines least-privilege policies for Lambda:

- `dynamodb:PutItem`
- `sns:Publish`
- `logs:CreateLogGroup`
- `logs:PutLogEvents`
- `s3:GetObject`

---

### **CloudWatch Module**

- Log group for Lambda
- Retention policy

---

## **Troubleshooting & Logs**

Common issues and fixes:

- **Lambda failing on init** → Missing environment variables → added `environment {}` block
- **DynamoDB rejecting writes** → Incorrect partition key → fixed key name
- **Trigger not firing** → Missing `aws_lambda_permission` → added correct principal + ARN
- **Zip not updating** → Changed `source_code_hash` to force redeploy
- **AccessDenied** → Updated IAM trust/policies

Useful commands:

```bash
terraform plan
terraform apply -refresh-only
aws logs tail /aws/lambda/<function-name> --follow

```

---

## **What I Learned / What This Project Shows**

- How to build **real serverless pipelines** with AWS
- How S3, Lambda, DynamoDB, SNS, IAM, and CloudWatch interact
- Why IAM design is 90% of serverless engineering
- How Terraform modules simplify event-driven architecture
- How to debug distributed systems using CloudWatch
- Packaging Lambda functions through Terraform workflows
- How to structure a multi-file Terraform project for automation

This project represents my first complete **production-style AWS automation system**.

---

## **Useful Links**

- [AWS Lambda Docs](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [SNS Docs](https://docs.aws.amazon.com/sns/)
- [S3 Event Notifications](https://docs.aws.amazon.com/AmazonS3/latest/userguide/NotificationHowTo.html)
- [DynamoDB Docs](https://docs.aws.amazon.com/dynamodb/)
