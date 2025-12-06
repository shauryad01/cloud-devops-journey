resource "aws_cloudwatch_log_group" "serverless_log_group" {
  name              = "/aws/lambda/serverless-lambda-${var.env}"
  retention_in_days = 14
  lifecycle {
    create_before_destroy = true
  }

  tags = {
    environment = var.env
  }

}
