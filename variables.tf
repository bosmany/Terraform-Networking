# variables.tf
variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  default     = "ami-084568db4383264d4" # Ubuntu 20.04 LTS
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  default     = "t3.micro"
}

variable "project_name" {
  description = "Bilal Project"
  type        = string
}

variable "azs" {
  description = "Availability Zones for the VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]  # ✅ Correct AZs for us-east-1
}



