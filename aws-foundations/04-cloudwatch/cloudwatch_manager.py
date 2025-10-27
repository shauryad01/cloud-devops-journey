import boto3
import datetime

cloudwatch = boto3.client('cloudwatch')

def create_alarm(instance_id):
    cloudwatch.put_metric_alarm(
        AlarmName=f'CPU_Utilization_{instance_id}',
        MetricName='CPUUtilization',
        Namespace='AWS/EC2',
        Statistic='Average',
        Period=300,
        EvaluationPeriods=1,
        Threshold=70.0,
        ComparisonOperator='GreaterThanThreshold',
        Dimensions=[{'Name': 'InstanceId', 'Value': instance_id}],
        ActionsEnabled=False,
        AlarmActions=[],
        AlarmDescription='Alarm when CPU exceeds 70%',
        Unit='Percent'
    )

def get_metrics(instance_id):
    return cloudwatch.get_metric_statistics(
        Namespace='AWS/EC2',
        MetricName='CPUUtilization',
        Dimensions=[{'Name': 'InstanceId', 'Value': instance_id}],
        StartTime=datetime.datetime.utcnow() - datetime.timedelta(minutes=10),
        EndTime=datetime.datetime.utcnow(),
        Period=300,
        Statistics=['Average']
    )
