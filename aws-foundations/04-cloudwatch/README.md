# 04 – CloudWatch Monitoring & Alerts

Learned how to monitor EC2 instance metrics, create CloudWatch alarms for CPU utilization, and enable detailed monitoring using AWS Console and Python’s Boto3 SDK.

---

## 📌 What I Did

**Checked EC2 Monitoring Metrics**

- Explored default EC2 metrics (CPU, Network, Disk) in the AWS Management Console.
- Enabled optional detailed monitoring (for finer granularity, note: this may cost beyond the free tier).

---

**Created CloudWatch Alarm for High CPU**

- From AWS Console:

  1.  Selected target EC2 instance.
  2.  Went to Monitoring tab → Create Alarm.
  3.  Chose metric: `CPUUtilization`.
  4.  Set threshold (e.g., 70% for 1 datapoint).
  5.  Configured actions: send to an SNS topic (optional: email notification).

---

**Simulated a CPU Spike (Alarm Trigger)**

    # Simulate CPU spike in EC2 instance (Python)
    import time

    def simulate_cpuspike(duration=30, cpu_percent=80):
        print(f"Simulating CPU spike at {cpu_percent}% ...")
        start_time = time.time()
        while time.time() - start_time < duration:
            _ = [x**2 for x in range(100000)]

- Ran script via SSH to EC2: `sudo python3 cpuspike.py`
- Monitored alarm state change in CloudWatch dashboard. Alarm moved into ‘ALARM’ state when CPU crossed threshold.

---

**Fetched Metrics & Created Alarm with Boto3**

_Python example to fetch metrics and create a CloudWatch alarm for EC2:_

    import boto3

    cloudwatch = boto3.client("cloudwatch")

    # Fetch average CPU utilization stats
    def get_ec2_metrics(instance_id):
        metrics = cloudwatch.get_metric_statistics(
            Namespace="AWS/EC2",
            MetricName="CPUUtilization",
            Dimensions=[{"Name": "InstanceId", "Value": instance_id}],
            StartTime="2025-10-26T00:00:00Z",
            EndTime="2025-10-27T00:00:00Z",
            Period=300,
            Statistics=["Average"]
        )
        print(metrics)

    # Create a CloudWatch alarm for CPU > 70%
    def create_alarm(instance_id):
        cloudwatch.put_metric_alarm(
            AlarmName=f"HighCPU-{instance_id}",
            ComparisonOperator="GreaterThanThreshold",
            EvaluationPeriods=1,
            MetricName="CPUUtilization",
            Namespace="AWS/EC2",
            Period=300,
            Statistic="Average",
            Threshold=70.0,
            ActionsEnabled=True,
            AlarmDescription="Alarm when CPU exceeds 70%",
            Dimensions=[{"Name": "InstanceId", "Value": instance_id}],
            Unit="Percent"
        )
        print(f"Alarm created for instance {instance_id}")

- Used in modular “cloudwatch_manager.py” as part of the assignment.

---

**Automated Monitoring Pipeline**

- Integrated steps in an automation script (`automation.py`):

  - Launch EC2, create S3 bucket, upload file, attach IAM roles/policies, and fetch metrics, create alarms—all via Python (Boto3).

- Validated end-to-end by verifying alert status in CloudWatch dashboard, script output, and SNS/email notification.

---

## 📝 Why This Matters

- **Operational Awareness:** Real-time resource monitoring is critical for uptime and performance.
- **Incident Response:** Alarms proactively notify you about abnormal resource usage.
- **Automation:** Scripting monitoring setup (Boto3) saves manual effort, ensures consistent infrastructure policy.
- **Cost Control:** Early alerts prevent runaway usage charges or outages.

---

## 🔗 Useful Links

- [AWS CloudWatch Documentation](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html)
- [AWS CloudWatch Alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html)
- [Boto3 CloudWatch API Guide](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/cloudwatch.html)
- [Detailed Monitoring vs. Basic Monitoring](https://aws.amazon.com/cloudwatch/pricing/)
