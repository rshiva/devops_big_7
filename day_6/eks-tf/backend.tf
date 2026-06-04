terraform {
  required_version = ">=1.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.48"
    }
  }
  backend "s3" {
    bucket = "devopsrt-home-lab-tfstate-dev"
    key =  "devops_big_7_eks/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "devopsrt-big7-eks-tfstate-lock-dev"
    encrypt = true

  }
}
