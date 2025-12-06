# output "ec2_public_ip" {
#   value = aws_instance.ec2instance.public_ip
# }
# output "ec2_public_dns" {
#   value = aws_instance.ec2instance.public_dns
# }
# output "ec2_private_ip" {
#   value = aws_instance.ec2instance.private_ip
# }
# output "ec2_private_dns" {
#   value = aws_instance.ec2instance.private_dns
# }

output "ec2_public_ip" {
  value = [
    for key in aws_instance.ec2instance : key.public_ip
  ]
}
output "ec2_public_dns" {
  value = [
    for key in aws_instance.ec2instance : key.public_dns
  ]
}
output "ec2_private_ip" {
  value = [
    for key in aws_instance.ec2instance : key.private_ip
  ]
}
output "ec2_private_dns" {
  value = [
    for key in aws_instance.ec2instance : key.private_dns
  ]
}
