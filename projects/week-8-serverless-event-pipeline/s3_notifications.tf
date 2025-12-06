resource "aws_s3_bucket_notification" "serverless_bucket_notification" {
  bucket = aws_s3_bucket.serverless_pipeline_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.lambda_function.arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [
    aws_lambda_permission.lambda_s3_permission,
  ]

}
