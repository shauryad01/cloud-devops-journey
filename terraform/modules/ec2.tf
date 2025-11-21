resource "aws_key_pair" "terra_key" {
  key_name   = "terraform-key"
  public_key = file("terra-key-ec2.pub")
}

resource "aws_default_vpc" "default" {

}


resource "aws_security_group" "mysecgroup" {
  name        = "automate-sg"
  description = "this will add a TF generated security group"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH Open"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP Open"
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Flask app"
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
  }

  tags = {
    name = "automate-sg"
  }

}


resource "aws_instance" "ec2instance" {
  key_name        = aws_key_pair.terra_key.key_name
  security_groups = [aws_security_group.mysecgroup.name]
  instance_type   = "t2.micro"
  ami             = "ami-0ecb62995f68bb549"

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "Terraform-EC2-Automate"
  }
}
