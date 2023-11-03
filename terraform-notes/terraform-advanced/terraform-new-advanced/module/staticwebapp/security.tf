resource "aws_security_group" "test-security" {
  name        = "${local.key_name}-test-security"
  description = "allow traffic to the ports given"

  # dynamic "ingress" {
  #   for_each = toset([8080, 80, 443])
  #   iterator = port
  #   content {
  #     description = "TLS from VPC"
  #     from_port   = port.value
  #     to_port     = port.value
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   }
  # }
  dynamic "ingress" {
    for_each = var.ports

    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value.from_port
      # to_port     = port.value.to_port
      to_port     = try(port.value.to_port, port.value.from_port)
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "aditya-security"
  }
}


