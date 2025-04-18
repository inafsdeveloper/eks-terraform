variable "vpc_cidr" {
  description = "VPC CIDR block"
}

variable "public_subnets" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
}

variable "region" {
  description = "AWS region"
}