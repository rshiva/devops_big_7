variable "aws_profile" {
  default = "devops"
  type = string
  description = "AWS profile"
}

variable "aws_region" {
  type = string
  default = "us-east-1"
  description = "AWS region"
}

variable "aws_vpc_cidr" {
  type = string
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
  
}