resource "aws_iam_role" "ec2_role" {
  name = "myapp-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })

  tags = var.tags
}

resource "aws_iam_policy" "custom_policy" {
  name        = "myapp-policy"
  description = "Custom IAM policy for EC2"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:ListBucket",
          "ec2:Describe*"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.custom_policy.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "myapp-ec2-profile"
  role = aws_iam_role.ec2_role.name
}
