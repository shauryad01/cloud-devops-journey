resource "aws_s3_bucket" "remote_s3" {
  bucket = "remote-infra-bucket-123123"

  tags = {
    Name = "remote-infra-bucket-123123"
  }
}
