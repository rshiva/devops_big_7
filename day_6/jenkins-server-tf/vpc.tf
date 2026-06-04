resource "aws_vpc" "day_6_vpc"{
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "${local.name_prefix}-vpc"
  }
}

resource "aws_subnet" "day_6_public_subnet"{
  vpc_id = aws_vpc.day_6_vpc.id
  cidr_block = var.public_subnet
  map_public_ip_on_launch = true
  tags = {
    Name = "${local.name_prefix}-subnet"
  }
}

resource "aws_internet_gateway" "day_6_igw" {
  vpc_id = aws_vpc.day_6_vpc.id
  tags = {
    Name = "${local.name_prefix}-igw"
  }
}


resource "aws_route_table" "day_6_rt"{
  vpc_id = aws_vpc.day_6_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.day_6_igw.id
  }
  tags = {
    Name = "${local.name_prefix}-rt"
  }
}

resource "aws_route_table_association" "day_6_rta" {
  route_table_id = aws_route_table.day_6_rt.id
  subnet_id = aws_subnet.day_6_public_subnet.id
}

resource "aws_security_group" "day_6_sg" {
  description = "Allowing Jenkins, sonarqube, SSH access"
  vpc_id = aws_vpc.day_6_vpc.id
  ingress = [
      for port in [22, 8080, 9000] : {
        description      = "TLS from VPC"
        from_port        = port
        to_port          = port
        protocol         = "tcp"
        ipv6_cidr_blocks = ["::/0"]
        self             = false
        prefix_list_ids  = []
        security_groups  = []
        cidr_blocks      = ["0.0.0.0/0"]
      }
    ]

    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "${local.name_prefix}-security_groups"
    }
}
