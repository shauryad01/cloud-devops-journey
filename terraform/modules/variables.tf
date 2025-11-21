variable "ec2_instance_type" {
  default = "t2.micro"
  type    = string
}

variable "ec2_default_root_storage_size" {
  default = 10
  type    = number
}

variable "ec2_ami_id" {
  default = "ami-0ecb62995f68bb549"
  type    = string
}
