# Week 7 — Multi-Environment AWS Infrastructure Using Terraform Modules

A fully Infrastructure-as-Code (IaC) project using Terraform to provision a complete AWS setup across three environments: **dev**, **stg**, and prd. Everything — EC2 instances, DynamoDB tables, S3 buckets, VPCs, and Security Groups — is deployed through custom Terraform modules, ensuring a clean, reusable, and scalable IaC structure.

This week focused on building infra the DevOps way: modular, reproducible, environment-aware, and version-controlled.

## Features

- Provision three isolated environments:

  - **dev:** 1 EC2, 1 DynamoDB table, 1 S3 bucket, 1 VPC, 1 SG
  - **stg:** 1 EC2, 1 DynamoDB table, 1 S3 bucket, 1 VPC, 1 SG
  - **prd:** 2 EC2s, 1 DynamoDB table, 1 S3 bucket, 1 VPC, 1 SG

- Uses custom Terraform modules for:

  - EC2
  - S3
  - DynamoDB
  - VPC
  - Security Groups

- Clean folder structure for scalable infra
- Full variable support for environment-specific overrides
- Idempotent deployments using Terraform plan/apply
- Ready for remote state backends (S3 + DynamoDB)
- Reusable code for future microservices/infrastructure projects

## Folder structure

    week-7-terraform-infra-modules/
    ├── infra-app/
    │ ├── ec2.tf
    │ ├── s3.tf
    │ ├── dynamodb.tf
    │ ├── vpc.tf
    │ ├── variables.tf
    │ ├── main.tf
    │ ├── providers.tf
    │ └── terra-key-ec2.pub
    ├── terraform.tf
    ├── variables.tf
    └── README.md

## Requirements

- AWS account with permissions for:
  - EC2, S3, DynamoDB
  - IAM
  - VPC + Networking
- Terraform installed (v1.0+)
- AWS CLI configured for authentication
- SSH key for EC2 access (`terra-key-ec2.pub` in this project)

## Quick Start

1.  Initialize Terraform

        terraform init

Downloads AWS provider, sets up modules, and prepares the environment for provisioning.

2.  Select an Environment  
    Use Terraform workspaces or variable files:

            terraform workspace new dev
            terraform workspace select dev

or

    terraform apply -var-file="dev.tfvars"

3. Deploy Infrastructure

Terraform provisions:

- **dev & stg:** 1 EC2 instance, 1 DynamoDB table, 1 S3 bucket, 1 VPC, 1 Security Group
- **prd:** 2 EC2 instances, 1 DynamoDB table, 1 S3 bucket, 1 VPC, 1 Security Group

## Module Overview

Each module manages a dedicated resource type:

- **EC2 Module**  
  AMI, instance type, key pair, SG attachment, optional user-data for bootstrapping

- **S3 Module**  
  Bucket creation + tagging, environment-specific naming

- **DynamoDB Module**  
  Table creation with chosen partition key, PAY_PER_REQUEST billing for dev/stg, ready for scaling in prod

- **VPC Module**  
  VPC creation, subnets + routing expansion ready

- **Security Group Module**  
  SSH + HTTP ingress, full egress, reusable across environments

## Troubleshooting & Logs

Common issues:

- IAM permission errors → fix AWS credentials / provider config
- Duplicate bucket names → add unique suffix using `random_id`
- EC2 key mismatch → ensure `terra-key-ec2.pub` exists
- Bad module references → verify module source paths

Terraform provides detailed logs using:

    terraform plan
    terraform apply -refresh-only

## What I Learned / What This Project Shows

- How to structure real Terraform projects, not just single `.tf` files
- Writing reusable modules for long-term maintainability
- Creating multi-environment infrastructure in a clean, repeatable way
- How VPC, EC2, S3, DynamoDB, and SGs connect as a real architecture
- The power of IaC: zero manual configuration, zero drift
- How prod environments differ from dev/stg when scaling resources
- This project marks the first step toward production-grade DevOps infrastructure

## Useful Links

- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

- [Terraform Modules Guide](https://developer.hashicorp.com/terraform/language/modules)
- [AWS EC2 Docs](https://docs.aws.amazon.com/ec2/)
- [AWS DynamoDB Docs](https://docs.aws.amazon.com/dynamodb/)
- [AWS VPC Docs](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)
