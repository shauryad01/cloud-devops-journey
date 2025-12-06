resource "aws_sns_topic" "upload_alerts" {
  name = "upload-alerts-${var.env}"
}

resource "aws_sns_topic_subscription" "upload_alerts_subscription" {
  topic_arn = aws_sns_topic.upload_alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}
