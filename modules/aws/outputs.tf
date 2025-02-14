output "instance_ip" {
  value = aws_instance.ec2.public_ip
}
output "aws_security_group_name" {
  value = aws_security_group.ec2_sg.name
}