resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "serverless_pipeline_bucket" {
  bucket = "serverless-pipeline-bucket-${var.env}-${random_id.bucket_id.hex}"

  tags = {
    environment = var.env
  }
}
