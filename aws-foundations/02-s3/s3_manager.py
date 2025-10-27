import boto3

s3 = boto3.client('s3')

def create_bucket(bucket_name):
    s3.create_bucket(Bucket=bucket_name, ACL='public-read')
    return bucket_name

def upload_file(bucket_name, file_name, key_name):
    s3.upload_file(file_name, bucket_name, key_name, ExtraArgs={'ACL': 'public-read'})

def download_file(bucket_name, key_name, file_name):
    s3.download_file(bucket_name, key_name, file_name)

def list_objects(bucket_name):
    return s3.list_objects_v2(Bucket=bucket_name)
