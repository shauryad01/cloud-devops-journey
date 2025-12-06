# **Terraform — Infrastructure as Code (IaC)**

Explored Terraform fundamentals, AWS provider configuration, resource creation, modularization, and built multiple pieces of AWS infrastructure — all declaratively and fully automated.

---

## 📌 **What I Did**

### **Set Up Terraform for AWS**

- Installed Terraform and verified setup using:

  ```bash
  terraform -version

  ```

- Configured AWS CLI for credentials (`aws configure`)
- Created provider configuration:

  ```hcl
  provider "aws" {
    region = "us-east-1"
  }

  ```

- Built `variables.tf`, `outputs.tf`, and cleaned the folder structure.

---

### **Provisioned Core AWS Resources Using Terraform**

- **EC2 instance** with:

  - AMI selection
  - Instance type
  - Root volume configuration
  - Automated Nginx installation via `user_data`

- **Security Group**

  - SSH (22)
  - HTTP (80)
  - Flask port (8000)

- **S3 bucket** for storage + tagging
- **DynamoDB table** (partition key + PAY_PER_REQUEST)
- **Key Pair** auto-generated via Terraform for EC2 SSH

Example snippet:

```hcl
resource "aws_instance" "server" {
  ami           = var.ami
  instance_type = var.instance_type
  user_data     = file("install_nginx.sh")
}

```

---

### **Learned and Used Terraform Commands**

- Initialization

  ```
  terraform init

  ```

- Dry-run planning

  ```
  terraform plan

  ```

- Apply infrastructure changes

  ```
  terraform apply

  ```

- Destroy resources

  ```
  terraform destroy

  ```

Also practiced:

- `terraform fmt`
- `terraform validate`
- Inspecting state files

---

### **Created Custom Terraform Modules**

Learned how modules improve **reusability, readability, and multi-environment design**.

- Built an **EC2 module** that accepts env-based variables.
- Started a **VPC module** (subnets, routing, IGW).
- Added module-level variables + outputs.
- Practiced referencing modules:

```hcl
module "ec2" {
  source        = "./modules/ec2"
  instance_type = var.instance_type
  env           = var.env
}

```

---

### **Managed Terraform State**

- Understood and explored state files (`terraform.tfstate`)
- Saw how Terraform tracks resources it created
- Set up `.gitignore` to avoid committing sensitive files
- Learned about remote backends (S3 + DynamoDB), preparing the directory for enterprise-style workflows

---

### **Debugged Real Issues**

- Missing tags & wrong key pair paths
- Ubuntu EC2 failing to update (fixed SG egress rules)
- `user_data` not executing → corrected AMI + script syntax
- S3 bucket naming collisions
- Module path & variable reference errors
- State drift during testing → explored `refresh-only`

Every error made the IaC more reliable.

---

## 📝 **Why This Matters**

- **Automation →** Infra becomes repeatable and version-controlled
- **Scalability →** Modules allow multi-environment setups
- **Security →** Terraform prevents resource drift and misconfigurations
- **Skill-building →**

  - Cloud fundamentals (EC2, VPC, SG, S3, DynamoDB)
  - IaC best practices
  - Understanding dependency graphs
  - Managing state safely

This directory now acts as the foundation for real DevOps workflows and CI/CD integrations.

---

## 🔗 **Useful Links**

- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

- [TrainWithShubham Terraform Tutorial](https://youtu.be/S9mohJI_R34?si=dhAX0PXDeL_FaVVF)
- [Terraform CLI Commands](https://developer.hashicorp.com/terraform/cli)
- [Terraform Modules Guide](https://developer.hashicorp.com/terraform/language/modules)
- [AWS EC2 Docs](https://docs.aws.amazon.com/ec2/)
- [AWS VPC Docs](https://docs.aws.amazon.com/vpc/)
