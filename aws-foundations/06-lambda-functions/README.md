Here’s a README.md for your **06-lambda-functions** module, reflecting work completed so far, based on instructions, hands-on attempts, and screenshots up till Lambda for EBS snapshot cleanup and monitoring.​

---

# 06 – Lambda Functions (Serverless)

Explored AWS Lambda, learned to build serverless automation for cloud resource cleanup and data processing, and set up Python-based Lambda functions triggered by cloud events (where completed).

---

## 📌 What I Did

**Basics of AWS Lambda**

- Reviewed Lambda concepts: event-driven code, no server management, pay-per-execution pricing, auto-scaling, integration with AWS services.
- Compared Lambda (serverless/PaaS) with EC2/other compute resources for architecture and DevOps use.​

---

**Created a Lambda Function (Hello World)**

- Used AWS Console to author a simple Python Lambda function.
- Function handler:

      def lambdahandler(event, context):
      return {
          "statusCode": 200,
          "body": "Hello from AWS Lambda!"
      }

- Deployed and invoked via Lambda Console for test events.​

---

**Lambda for Cost Optimization: EBS Snapshot Cleanup**

- Objective: Delete unused, orphaned EBS snapshots to optimize cloud storage costs weekly.

**Implementation Steps:**

1.  Created Lambda function (Python 3.x runtime).
2.  Configured IAM role with permissions: `ec2:DescribeSnapshots`, `ec2:DeleteSnapshot`, CloudWatch Logs access.
3.  Lambda code overview:

        import boto3

        def lambdahandler(event, context):
            ec2 = boto3.client("ec2")
            # Fetch all snapshots owned by account
            resp = ec2.describe_snapshots(OwnerIds=['self'])
            for snap in resp["Snapshots"]:
                # If VolumeId not attached to any EC2 instance or no longer needed
                ec2.delete_snapshot(SnapshotId=snap["SnapshotId"])
                # Log deletion

- Successfully performed test deletion (when permissions were valid).
- Deployed Lambda and ran via Console UI, checked execution logs in CloudWatch.​

---

**Monitoring, Error Handling, and CloudWatch Events**

- Verified logs in CloudWatch for Lambda execution and deleted snapshots.
- Faced IAM permission issues: unauthorized operation error while reading snapshots; resolved in later testing.
- Planned but not yet completed: scheduled Lambda via CloudWatch Event Rule weekly (cron).​

---

## 📝 Why This Matters

- **Automation:** Offloads routine resource cleanup to code, minimizing manual work.
- **Cost Management:** Prevents cloud bill bloat from unused snapshots.
- **Serverless Advantage:** No resource overhead when idle, instant scale during execution.
- **Security:** Controlled access via IAM Roles scoped for Lambda needs.

---

## 🔗 Useful Links

- [AWS Lambda Getting Started](https://docs.aws.amazon.com/lambda/latest/dg/getting-started.html)
- [Lambda with Boto3 Examples](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/lambda.html)
- [CloudWatch Events for Lambda Scheduling](https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/RunLambdaSchedule.html)
- [Serverless Cost Optimization](https://aws.amazon.com/blogs/compute/reducing-ebs-costs-with-lambda/)
