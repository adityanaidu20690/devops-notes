

resource "aws_instance" "addy" {
  ami                    = "ami-0453898e98046c639"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.developer.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "first-instance"
  }
}



resource "aws_key_pair" "developer" {
  key_name   = "developer"
  public_key = file("${path.module}/id_rsa.pub")
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  dynamic "ingress" {
    for_each = [80, 443, 22]
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

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
