resource "aws_iam_role" "lambda_exec_role" {
  name = "Lambda-exec-role-${var.env}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_exec_policy" {
  name        = "Lambda-exec-policy-${var.env}"
  description = "IAM policy for Lambda execution role"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sns:Publish",
          "dynamodb:PutItem",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })

}

resource "aws_iam_role_policy_attachment" "lambda_exec_role_attachment" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = aws_iam_policy.lambda_exec_policy.arn

}
