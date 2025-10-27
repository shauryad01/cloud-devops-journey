import boto3

iam = boto3.client('iam')

def create_user(user_name):
    iam.create_user(UserName=user_name)
    return user_name

def attach_policy(user_name, policy_arn):
    iam.attach_user_policy(UserName=user_name, PolicyArn=policy_arn)

def detach_policy(user_name, policy_arn):
    iam.detach_user_policy(UserName=user_name, PolicyArn=policy_arn)

def list_users():
    return iam.list_users()
