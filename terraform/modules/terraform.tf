terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.22.0"
    }
  }
  backend "s3" {
    bucket         = "remote-infra-bucket-123123"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-table"
  }
}
