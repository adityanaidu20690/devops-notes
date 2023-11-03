resource "aws_security_group" "addy-security" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  dynamic "ingress" {
    for_each = [
        {
            from_port = 80,
            to_port = 90,
            cidr = ["192.168.1.0/24"]
        },
         {
            from_port = 22
            cidr = ["0.0.0.0/0"]
        },
         {
            from_port = 443
            cidr = ["192.168.2.0/24"]
        }
    ]
    iterator = port # you can give any value to the iterator
    content {
      description = "TLS from VPC"
      from_port   = port.value.from_port
      to_port     = try(port.value.to_port , port.value.from_port)
      protocol    = "tcp"
    #   cidr_blocks = ["0.0.0.0/0"]
    cidr_blocks = [port.value.cidr]

    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "addy-security"
  }
}