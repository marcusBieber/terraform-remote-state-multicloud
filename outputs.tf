output "instance_ip" {
  value = module.aws_resources.instance_ip
}

output "aws_security_group_name" {
  value = module.aws_resources.aws_security_group_name
}

output "storage_account_name" {
  value = module.azure_resources.storage_account_name
}

output "storage_container_name" {
  value = module.azure_resources.storage_container_name
}