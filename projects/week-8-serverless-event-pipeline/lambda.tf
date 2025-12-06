data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/lambda"
  output_path = "${path.module}/lambda.zip"
}

resource "aws_lambda_function" "lambda_function" {
  filename         = data.archive_file.lambda_zip.output_path
  function_name    = "serverless-lambda-${var.env}"
  role             = aws_iam_role.lambda_exec_role.arn
  handler          = "index.handler"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  runtime          = "python3.12"
  depends_on       = [aws_iam_role.lambda_exec_role, aws_iam_role_policy_attachment.lambda_exec_role_attachment]
  environment {
    variables = {
      DYNAMO_TABLE_NAME = aws_dynamodb_table.serverless_table.name
      SNS_TOPIC_ARN     = aws_sns_topic.upload_alerts.arn
    }
  }

}

resource "aws_lambda_permission" "lambda_s3_permission" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.serverless_pipeline_bucket.arn
  depends_on = [
    aws_s3_bucket.serverless_pipeline_bucket,
    aws_lambda_function.lambda_function
  ]
}
