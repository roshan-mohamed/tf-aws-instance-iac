resource "aws_instance" "example" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  security_groups        = [aws_security_group.allow_opentraffic.name]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name

  tags = var.tags
}
