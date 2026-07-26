terraform {
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "~> 6.0"
        }
    }
}

provider aws{
    region = "us-east-1"
}


data "aws_ami" "ubuntu"{
    most_recent = true


    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
    owners = ["099720109477"]
}

resource "aws_instance" "ec2-server"{
    ami = data.aws_ami.ubuntu.id
    instance_type = "t3.micro"

    tags = {
        Name = "jenkins"
    }
}