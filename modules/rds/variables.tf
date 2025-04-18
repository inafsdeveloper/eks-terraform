variable "vpc_id" {
  description = "VPC ID"
}

variable "private_subnets" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "db_name" {
  description = "RDS database name"
}

variable "db_username" {
  description = "RDS database username"
}

variable "db_password" {
  description = "RDS database password"
}

variable "eks_security_group_id" {
  description = "ID of the EKS security group"
  type        = string
}

variable "bastion_security_group_id" {
  description = "ID of the bastion security group"
  type        = string
}