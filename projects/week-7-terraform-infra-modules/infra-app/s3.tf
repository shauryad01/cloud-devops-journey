resource "aws_s3_bucket" "remote_s3" {
  bucket = "${var.env}-${var.bucket_name}-1212"

  tags = {
    Name        = "${var.env}-${var.bucket_name}-1212"
    Environment = var.env
  }
}
