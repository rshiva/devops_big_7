resource "aws_iam_role" "day_6_iam" {
  name = var.iam_role

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "${local.name_prefix}-role"
  }
}


# IAM policy
resource "aws_iam_role_policy_attachment" "day_6_attachments" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/CustomEKSFullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess",
    "arn:aws:iam::aws:policy/AmazonVPCFullAccess",
    "arn:aws:iam::aws:policy/IAMFullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess",
  ])

  role       = aws_iam_role.day_6_iam.name
  policy_arn = each.value
}

resource "aws_iam_instance_profile" "day_6_jenkins_profile" {
  name = "jenkins-instance-profile"
  role = aws_iam_role.day_6_iam.name
}
