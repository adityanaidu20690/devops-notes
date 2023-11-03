here in this project we are exploring the concepts of security group


 dynamic "ingress" {
    for_each = [80, 443, 22, 8080]
    iterator = port # you can give any value to the iterator
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }
we are using the dynamic block here and giving the values of ports in a list format.
Instead of assigning the ingress value separately to each and every node we will use for_each.
after foreach we will use the iterator and we will give the value of it as port.
and after that we have given as block as content.
inside content we will asign the value to the attribute.
we will give the attribute name as from_port and to_port. The value of the attribute will be given as port.value.
