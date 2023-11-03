In this project we are using the advanced concepts
first we will come to the security.tf 
we have applied a problem statement here for example we have to allow the ports to different cidr range then we have to 
use the dynamic block.

dynamic "ingress" {
    for_each =  [
  {
    from_port   = 80,
    to_port     = 90,
    cidr_blocks = ["0.0.0.0/0"]

  },

  {
    from_port = 443

    cidr_blocks = ["0.0.0.0/0"]
  },

  {
    from_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
]
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

  we have used the for_each and we have given the multiple ports and the different cidr range for the ports to be accesed under the list.
 we have now given the values in the variable and given the name as ports.


 dynamic "ingress" {
    for_each = var.ports
#we have given the values to the ports in the variable.tf

    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value.from_port
      # to_port     = port.value.to_port
      to_port     = try(port.value.to_port, port.value.from_port)
      # we are using the try block bcz we are telling the code to use the same port valur given as outbound or we will 
       consider the from port values .
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  here we have assigned the port values to variable name ports.
  so now in security.tf we will give the attribute as from_port and the value will "port.value.from_port" by giving this value
  we will allow the inbound traffic.


We have the used the provisioner block type remote-exe and file type.
we are executing the bootstrapfile using the remote-exe provisioner.
using the file type provisioner we are deploying the the src folder from the local machine to the remote machine to the 
given destination.