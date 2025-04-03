# outputs.tf
output "vpc_id" {
  description = "The ID of the created VPC"
  value       = module.network.vpc_id
}

output "public_subnets" {
  description = "The IDs of the public subnets"
  value       = module.network.public_subnets
}

output "security_group_id" {
  description = "The ID of the created security group"
  value       = module.security.sg_id
}

output "ec2_instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = module.compute.public_ip
}
