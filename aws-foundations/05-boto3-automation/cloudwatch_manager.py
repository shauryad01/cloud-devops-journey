import boto3
cloudwatch = boto3.client('cloudwatch')

def get_ec2_metrics(instance_id):
    metrics = cloudwatch.get_metric_statistics(
        Namespace='AWS/EC2',
        MetricName='CPUUtilization',
        Dimensions=[{'Name': 'InstanceId', 'Value': instance_id}],
        StartTime='2025-10-26T00:00:00Z',
        EndTime='2025-10-27T00:00:00Z',
        Period=300,
        Statistics=['Average'])
    print(metrics)

def create_alarm(instance_id):
    cloudwatch.put_metric_alarm(
        AlarmName=f'HighCPU_{instance_id}',
        ComparisonOperator='GreaterThanThreshold',
        EvaluationPeriods=1,
        MetricName='CPUUtilization',
        Namespace='AWS/EC2',
        Period=300,
        Statistic='Average',
        Threshold=70.0,
        ActionsEnabled=False,
        AlarmDescription='Alarm when CPU > 70%',
        Dimensions=[{'Name': 'InstanceId', 'Value': instance_id}],
        Unit='Percent')
    print(f"Alarm created for instance {instance_id}")
