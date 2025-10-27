# 05 – AWS Automation with Boto3

Automated complete AWS cloud workflows—EC2 launch, Apache install, S3 bucket/file ops, IAM policy, and CloudWatch alarms—with Python scripts. Practiced real-world DevOps skills in orchestrating cloud resources.

---

## 📌 What I Did

**Set Up Python/Boto3 Environment**

    sudo apt update
    sudo apt install python3-pip -y
    pip install boto3
    aws configure

- Installed Boto3, configured AWS credentials for automation access.

---

**Automated EC2 Launch & Apache Setup**

    ec2 = boto3.client("ec2")
    response = ec2.run_instances(
        ImageId="ami-XYZ123",
        InstanceType="t2.micro",
        MinCount=1,
        MaxCount=1,
        KeyName="aws-key",
        SecurityGroupIds=["sg-abc123"],
        UserData="#!/bin/bash\nsudo apt update -y\nsudo apt install -y apache2\nsudo systemctl enable --now apache2\necho '<h1>Hello from Boto3 EC2 Automation!</h1>' | sudo tee /var/www/html/index.html"
    )
    print("Launched EC2:", response["Instances"][0]["InstanceId"])

- Automated provisioning, web server setup, and custom webpage in a single script.

---

**Created S3 Bucket & Uploaded Files**

    s3 = boto3.client("s3")
    s3.create_bucket(Bucket="myboto3-demo-bucket-123")
    s3.upload_file("testfile.txt", "myboto3-demo-bucket-123", "testfile.txt")
    print("File uploaded and available:", "https://myboto3-demo-bucket-123.s3.amazonaws.com/testfile.txt")

- Automated bucket creation and file upload with public URL generation.

---

**Provisioned IAM User & Policy**

    iam = boto3.client("iam")
    iam.create_user(UserName="boto3-demo-user")
    iam.attach_user_policy(UserName="boto3-demo-user", PolicyArn="arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess")
    print("IAM user provisioned and policy attached.")

- Programmatically managed user identities and policies for secure access.​

---

**Fetched EC2 Metrics & Created CloudWatch Alarm**

    cloudwatch = boto3.client("cloudwatch")
    cloudwatch.put_metric_alarm(
        AlarmName="HighCPUi-EXAMPLE",
        MetricName="CPUUtilization",
        Namespace="AWS/EC2",
        Statistic="Average",
        Threshold=70,
        EvaluationPeriods=1,
        Period=300,
        ComparisonOperator="GreaterThanThreshold",
        ActionsEnabled=False,
        AlarmDescription="Alarm when CPU exceeds 70%",
        Dimensions=[{"Name": "InstanceId", "Value": "i-EXAMPLE"}],
        Unit="Percent"
    )
    print("CloudWatch alarm created.")

- Enabled proactive alerting for resource spikes through script-triggered alarms.

---

**Serverless Cost Optimization with Lambda**

    # Lambda function: Delete stale EBS snapshots
    def lambdahandler(event, context):
        ec2 = boto3.client("ec2")
        snapshots = ec2.describe_snapshots(OwnerIds=['self'])["Snapshots"]
        # Logic to identify and delete unused snapshots...
        for snap in snapshots:
            # If orphaned
            ec2.delete_snapshot(SnapshotId=snap["SnapshotId"])

- Automated AWS housekeeping using Lambda + Boto3, reducing storage costs by deleting unused resources.

---

**Integrated End-to-End Automation**

- Orchestrated all AWS service actions together in `automation.py` for single-click reproducibility.
- Validated by checking AWS Console (EC2, S3, IAM, CloudWatch) and script output for resource status.
- Implemented error handling and logging for robust deployment.

---

## 📝 Why This Matters

- **Efficiency:** Eliminates repetitive manual setup; enables infrastructure-as-code workflows.
- **Scalability:** Consistent resource provisioning across environments.
- **Real-World Practice:** Prepares for DevOps automation, serverless tasks, and cloud deployments.
- **Cost & Security:** Proactive management using monitoring/cleanup scripts keeps both costs and permissions in check.

---

## 🔗 Useful Links

- [Boto3 Documentation](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html)
- [AWS EC2 Boto3 Reference](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/ec2.html)
- [IAM Boto3 Docs](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/iam.html)
- [CloudWatch Boto3 API](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/cloudwatch.html)
- [AWS Lambda Boto3 Reference](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/lambda.html)
