from ec2_manager import launch_instance
from s3_manager import create_bucket, upload_file
from iam_manager import create_user, attach_policy
from cloudwatch_manager import create_alarm

if __name__ == "__main__":
    print("Starting AWS Automation Pipeline...")

    # EC2 Launch + Apache
    instance_id = launch_instance()

    # S3 Bucket + Upload
    bucket_name = "myboto3-demo-bucket-123"
    create_bucket(bucket_name)
    upload_file(bucket_name, "testfile.txt")

    # IAM User
    username = "boto3-demo-user"
    create_user(username)
    attach_policy(username)

    # CloudWatch Alarm
    create_alarm(instance_id)

    print("All tasks completed successfully!")

