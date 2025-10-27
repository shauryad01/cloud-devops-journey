# 02 – S3 Management

Learned how to create, manage, and automate Amazon S3 storage using both the AWS CLI and Python’s `boto3`. Covered key S3 operations: creating buckets, uploading/downloading files, setting access permissions, and enabling static website hosting.

---

## 📌 What I Did

**Created and Listed Buckets**

```bash
aws s3 mb s3://my-demo-bucket-123 --region us-east-1
aws s3 ls

```

- Created a unique bucket.
- Verified creation and checked all accessible buckets.

---

**Uploaded and Downloaded Files**

```bash
echo "Hello from AWS S3" > testfile.txt
aws s3 cp testfile.txt s3://my-demo-bucket-123/
aws s3 cp s3://my-demo-bucket-123/testfile.txt ./downloaded.txt

```

- Uploaded a local file to S3.
- Downloaded it back to confirm data integrity.

---

**Listed and Managed Objects**

```bash
aws s3 ls s3://my-demo-bucket-123/
aws s3 rm s3://my-demo-bucket-123/testfile.txt

```

- Listed objects inside the bucket.
- Practiced safe deletion.

---

**Set Public Access and Static Hosting**

```bash
aws s3 website s3://my-demo-bucket-123/ --index-document index.html
aws s3api put-bucket-policy --bucket my-demo-bucket-123 --policy file://public-policy.json

```

- Configured bucket for static website hosting.
- Used a JSON policy to allow public read access.

`public-policy.json`

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::my-demo-bucket-123/*"
    }
  ]
}
```

---

**Boto3 Script – Automating S3**

```python
import boto3

s3 = boto3.client('s3')
bucket_name = "myboto3-demo-bucket-123"
file_name = "testfile.txt"

s3.create_bucket(Bucket=bucket_name)
print(f"Bucket {bucket_name} created.")

s3.upload_file(file_name, bucket_name, file_name)
print(f"Uploaded {file_name} to {bucket_name}/{file_name}")

objects = s3.list_objects_v2(Bucket=bucket_name)
for obj in objects.get('Contents', []):
    print(obj['Key'])

```

- Automated bucket creation and file upload via Python.
- Listed all files programmatically.

---

**Deleted Buckets and Cleaned Up**

```bash
aws s3 rm s3://my-demo-bucket-123 --recursive
aws s3 rb s3://my-demo-bucket-123 --force

```

- Removed all objects and deleted the bucket safely.

---

## 📝 Why This Matters

- **Storage Mastery:** S3 is the backbone of AWS for storing logs, backups, and artifacts.
- **Automation:** Knowing both CLI and Boto3 ensures full control for scripting and infrastructure automation.
- **Security Awareness:** Proper use of bucket policies prevents accidental exposure.
- **Deployment Ready:** Understanding hosting and lifecycle policies builds toward static site deployments and CI/CD pipelines.

---

## 🔗 Useful Links

- [Amazon S3 Documentation](https://docs.aws.amazon.com/s3/index.html)
- [AWS CLI S3 Reference](https://docs.aws.amazon.com/cli/latest/reference/s3/)
- [Boto3 S3 Client Docs](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/s3.html)
- [AWS S3 Best Practices](https://aws.amazon.com/s3/faqs/)
- [AWS Public Access Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-control-block-public-access.html)
