import boto3

ec2 = boto3.client('ec2')

def launch_instance():
    response = ec2.run_instances(
        ImageId='ami-0360c520857e3138f',
        InstanceType='t2.micro',
        MinCount=1,
        MaxCount=1,
        KeyName='aws-key',
        SecurityGroupIds=['sg-0f7a4f07ef4ed44cb'],
        UserData='''#!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        echo "Hello from Boto3 EC2 Automation!" > /var/www/html/index.html
        ''')
    return response['Instances'][0]['InstanceId']

def start_instance(instance_id):
    ec2.start_instances(InstanceIds=[instance_id])

def stop_instance(instance_id):
    ec2.stop_instances(InstanceIds=[instance_id])

def describe_instances():
    return ec2.describe_instances()
