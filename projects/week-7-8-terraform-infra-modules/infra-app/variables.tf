variable "env" {
  description = "Environment name for infra"
  type        = string
}
variable "bucket_name" {
  description = "Bucket name for infra"
  type        = string
}
variable "instance_count" {
  description = "This is no. of EC2 instances"
  type        = string
}
variable "instance_type" {
  description = "This is the type of EC2 instance"
  type        = string
}
variable "ec2_ami_id" {
  description = "This is the AMI ID of EC2 instance"
  type        = string
}
variable "hash_key" {
  description = "This is the hash key for DynamoDB table"
  type        = string
}
