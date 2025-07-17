data "aws_subnet" "selected_subnet" {
  id = var.subnet_id
}

resource "aws_security_group" "allow_opentraffic" {
  name        = "allow-opentraffic"
  description = "Allow traffic from 10.0.0.0/32"
  vpc_id      = data.aws_subnet.selected_subnet.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}
