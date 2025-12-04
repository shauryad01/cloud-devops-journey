resource "aws_dynamodb_table" "serverless_table" {
  name         = "serverless-table-${var.env}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "file_name"
  attribute {
    name = "file_name"
    type = "S"
  }
}
