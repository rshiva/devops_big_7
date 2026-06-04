
resource "aws_instance" "day_6_jenkins" {
  ami = data.aws_ami.ami.image_id
  instance_type = "t2.xlarge"
  key_name = var.key_name
  subnet_id = aws_subnet.day_6_public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.day_6_sg.id]
  iam_instance_profile = aws_iam_instance_profile.day_6_jenkins_profile.name
  root_block_device {
    volume_size = 30
  }
  user_data =  templatefile("tools-install.sh",{})
  tags = {
    Name = "${local.name_prefix}-ec2"
  }
}
