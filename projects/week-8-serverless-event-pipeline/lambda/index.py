import json
import os
import boto3

table_name = os.environ['DYNAMO_TABLE_NAME']
topic_arn = os.environ['SNS_TOPIC_ARN']

def handler(event, context):
    record = event["Records"][0]
    bucket = record["s3"]["bucket"]["name"]
    key    = record["s3"]["object"]["key"]
    time   = record["eventTime"]

    dynamodb = boto3.resource("dynamodb")
    table = dynamodb.Table(table_name)

    table.put_item(Item={
        "file_name": key,
        "bucket": bucket,
        "timestamp": time
    })

    sns = boto3.client("sns")
    sns.publish(
        TopicArn=topic_arn,
        Message=f"New file uploaded: {key} in {bucket} at {time}"
    )

    print(f"Uploaded file: {key}")
    print(f"Wrote to DynamoDB table: {table_name}")
    print(f"Sent SNS alert to: {topic_arn}")

