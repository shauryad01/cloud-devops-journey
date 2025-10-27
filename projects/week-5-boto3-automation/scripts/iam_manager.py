import boto3
iam=boto3.client('iam')

def create_user(username):
    iam.create_user(UserName=username)
    print(f"IAM user {username} created.")

def attach_policy(username,policy_arn='arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess'):
    iam.attach_user_policy(UserName=username, PolicyArn=policy_arn)
    print(f"Attached policy {policy_arn} to {username}")

def list_users():
    response = iam.list_users()
    for user in response['Users']:
        print(user['UserName'])
