import boto3

s3=boto3.client('s3')

def create_bucket(bucket_name):
    s3.create_bucket(Bucket=bucket_name)
    print(f"Bucket {bucket_name} created.")

def upload_file(bucket_name, file_name, object_name=None):
    object_name=object_name or file_name
    s3.upload_file(file_name, bucket_name, object_name)
    print(f"Uploaded file {file_name} to {bucket_name}/{object_name}")

def list_objects(bucket_name):
    response = s3.list_objects_v2(Bucket=bucket_name)
    for obj in response.get('Contents', []):
        print(obj['Key'])
