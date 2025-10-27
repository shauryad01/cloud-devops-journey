import boto3

ec2=boto3.client('ec2')

def describe_instances():
    response = ec2.describe_instances()
    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            print(f"ID: {instance['InstanceId']} | State: {instance['State']['Name']}")


def start_instance(instance_id):
    ec2.start_instances(InstanceIds=[instance_id])
    print(f"Started instance {instance_id}")

def stop_instance(instance_id):
    ec2.stop_instances(InstanceIds=[instance_id])
    print(f"Stopped instance {instance_id}")

def launch_instance():
    userdata_script = """#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2
echo "Hello from Boto3 EC2 Automation!" > /var/www/html/index.html
"""
    response = ec2.run_instances(
        ImageId='ami-0360c520857e3138f',
        InstanceType='t2.micro',
        MinCount=1,
        MaxCount=1,
        KeyName='aws-key',
        SecurityGroupIds=['sg-0f7a4f07ef4ed44cb'],
        UserData=userdata_script
    )
        
    instance_id=response['Instances'][0]['InstanceId']
    print(f"Launched EC2 instance: {response['Instances'][0]['InstanceId']}")
    return instance_id


