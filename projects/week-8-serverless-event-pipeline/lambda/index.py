import json

def handler(event, context):
    print("Received event: " + json.dumps(event))
    return {
        'statusCode': 200,
        'body': "Lambda executed successfully!"
    }
