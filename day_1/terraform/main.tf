# vpc
  # internet gateway
  # route table and route table association with subnet
#public-subnet
# private subnet for webapp
# private subnet for database
# database subnet only accessible by webapp private subnet

provider "aws" {
  profile = var.aws_profile
  region = var.aws_region
}

resource "aws_vpc" "app_vpc" {
  cidr_block  = var.aws_vpc_cidr 
  tags = {
    Name = "app_vpc"
  }
}

# internet gateway

resource "aws_internet_gateway" "app_igw" {
  vpc_id = aws_vpc.app_vpc.id
  tags = {
    Name = "app_igw"
  }
}

# public subnet

resource "aws_subnet" "app_public_subnet" {
  vpc_id = aws_vpc.app_vpc.id

}