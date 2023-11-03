here in this project we are giving different ports with different cidr range.

we are using different cidr ranges for each and every port.

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

we have used the dynamic block and under that we have for_each attribute.
for_each attribute we are giving the value in the form of list.
inside list we are giving the values with different port values with different cidr range.
we can give the value as below.

{
            from_port = 443
            cidr = ["192.168.2.0/24"]
        }


for the iterator attribute we are assigning the value as port.
after that we will be having a content block
we will give the value of the attribute from_port as port.value.from_port(it will take the value from the port value given)
to_port     = try(port.value.to_port , port.value.from_port) here we are using the try block for the code to take the value of the to_port if given
or to consider the from_port as to_port only.

in the cidr_blocks attribute we will give the value in a list format and give the value as [port.value.cidr]
cidr_blocks = [port.value.cidr]
