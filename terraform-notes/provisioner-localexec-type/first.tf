resource "aws_instance" "addy" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.developer.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "first-instance"
  }
 
  
  provisioner "local-exec" {  #we are using the command argument 
  when = destroy
    command = "echo hello > test.txt"  #we are using the echo command and we are transferring the data to a new file.
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip} > test2.txt" #we are finding the IP address of the machine created.
  }
  provisioner "local-exec" {
    when = destroy
 command = "env > env.txt"
 environment = {  #we declaring the environment variable by giving the environment block
   envname = "envvalue"
 }    
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
    for_each = var.ports
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


provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}
