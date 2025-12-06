# dev infrastructure
module "dev-infra" {
  source         = "./infra-app"
  env            = "dev"
  bucket_name    = "infra-bucket"
  instance_count = 1
  instance_type  = "t2.micro"
  ec2_ami_id     = "ami-0ecb62995f68bb549"
  hash_key       = "id"
}

# prd infrastructure
module "prd-infra" {
  source         = "./infra-app"
  env            = "prd"
  bucket_name    = "infra-bucket"
  instance_count = 2
  instance_type  = "t2.micro"
  ec2_ami_id     = "ami-0ecb62995f68bb549"
  hash_key       = "id"
}

# stg infrastructure
module "stg-infra" {
  source         = "./infra-app"
  env            = "stg"
  bucket_name    = "infra-bucket"
  instance_count = 1
  instance_type  = "t2.micro"
  ec2_ami_id     = "ami-0ecb62995f68bb549"
  hash_key       = "id"
}
