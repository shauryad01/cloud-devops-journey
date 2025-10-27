# 03 – IAM Management

Learned how to manage AWS Identity and Access Management (IAM) — creating users, groups, and roles; attaching permissions; and controlling access through policies using both AWS CLI and Boto3.

---

## 📌 What I Did

**Listed IAM Users and Groups**

```bash
aws iam list-users
aws iam list-groups
aws iam list-policies --scope AWS

```

- Checked existing IAM setup.
- Viewed AWS-managed and customer-managed policies.

---

**Created IAM Users and Groups**

```bash
aws iam create-user --user-name dev-user
aws iam create-group --group-name dev-group
aws iam add-user-to-group --user-name dev-user --group-name dev-group

```

- Created a dedicated IAM user.
- Grouped users for role-based access control.

---

**Attached Policies to Users and Groups**

```bash
aws iam attach-user-policy --user-name dev-user --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess
aws iam attach-group-policy --group-name dev-group --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

```

- Granted specific permissions using prebuilt AWS-managed policies.
- Practiced the principle of least privilege.

---

**Created a Custom IAM Policy**

`readonly-ec2-policy.json`

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["ec2:Describe*"],
      "Resource": "*"
    }
  ]
}
```

```bash
aws iam create-policy --policy-name ReadOnlyEC2 --policy-document file://readonly-ec2-policy.json

```

- Defined a fine-grained custom policy.
- Verified it appeared under _Customer Managed Policies_.

---

**Created and Configured IAM Roles**

```bash
aws iam create-role --role-name EC2S3ReadRole --assume-role-policy-document file://ec2-trust.json

```

`ec2-trust.json`

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": { "Service": "ec2.amazonaws.com" },
      "Action": "sts:AssumeRole"
    }
  ]
}
```

```bash
aws iam attach-role-policy --role-name EC2S3ReadRole --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess

```

- Built a role that allows EC2 to access S3.
- Learned how instance profiles connect IAM roles to EC2.

---

**Boto3 Script – IAM Automation**

```python
import boto3

iam = boto3.client('iam')

user = iam.create_user(UserName='boto3-demo-user')
print(f"IAM user {user['User']['UserName']} created.")

iam.attach_user_policy(
    UserName='boto3-demo-user',
    PolicyArn='arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess'
)
print("Attached S3ReadOnlyAccess policy.")

users = iam.list_users()
for u in users['Users']:
    print(u['UserName'])

```

- Automated IAM user creation and policy attachment.
- Listed users dynamically for audit checks.

---

**Deleted Users, Policies, and Roles**

```bash
aws iam detach-user-policy --user-name dev-user --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess
aws iam delete-user --user-name dev-user
aws iam delete-role --role-name EC2S3ReadRole
aws iam delete-policy --policy-arn arn:aws:iam::<account-id>:policy/ReadOnlyEC2

```

- Cleaned up users, roles, and policies safely.
- Ensured no leftover permissions.

---

## 📝 Why This Matters

- **Security Foundation:** IAM controls who can access what — the backbone of AWS governance.
- **Automation Ready:** Using CLI and Boto3 enables reproducible setups across environments.
- **Least Privilege Practice:** Reduces risks from overly broad permissions.
- **Integration:** Roles bridge EC2, Lambda, and other services for controlled cross-service access.

---

## 🔗 Useful Links

- [AWS IAM Documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)
- [AWS CLI IAM Reference](https://docs.aws.amazon.com/cli/latest/reference/iam/)
- [Boto3 IAM Client Docs](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/iam.html)
- [IAM Best Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
- [AWS Policy Generator](https://awspolicygen.s3.amazonaws.com/policygen.html)
