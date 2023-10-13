Here in this project we are creating a instance in aws using terraform.

We have deconstructed the terraform file into 
resources, providers.

In providers we will mention which provider are we using. we are using AWS as provider and we have to mention the access key and security key for it in AWS and give the value.


In resources we will mention what all resources are to be created using terraform file for aws.
 as we can see in the resource file we have created a instance , key-pair and security groups.
 the details are available in terraform documentation.

For the instance section we need a ami so that the instance can be created so we will mention the ami ID.
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
we will also create the security groups and mention the ports needed to access.
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group#security_groups
We will also create the key pair.

resource "aws_key_pair" "developer" {
  key_name   = "developer"
  public_key = file("${path.module}/id_rsa.pub")
}


Here in our project we have created the keypair by using the below.
We have created the ssh key by using command ssh-keygen -t rsa
the key will be generated and when it asks for the location to save the key please mention ./id_rsa.pub and hit enter.
in the key pair resource section in the public key argument we have are using the FILE FUNCTION and path.module builtin function.
In Terraform, ${path.module} is a built-in function that returns the file path of the module where it is being called.
file("${path.module}/id_rsa.pub") = this will read the contents mentioned in id_rsa.pub
${path.module}/id_rsa.pub = this will show the path of the file /id_rsa.pub


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
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "addy-security"
  }
}

Here in this section we are defining the security groups and we are givng the name of the security group as allow_tls.
We have specified the port which needed to be accessed. the problem here is for every port we have to mention the ingress and egress.
To avoid mentioning the security groups ingress and egress repeatedly we are using the dynamic block.

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

  in the dynamic block we are using for_each attribute to give the port numbers.
  we are also using the iterator attribute. In this attribute we are giving the value of port to be iterated/repeated.


resource "aws_instance" "addy" {
  ami                    = "ami-0453898e98046c639"
  instance_type          = "t2.micro"
  key_name               = "${aws_key_pair.developer.key_name}"
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "first-instance"
  }
}

In this resource block we are creating the instances.
in the key_name we are associating the key name. For that we are giving the name of the keyname and the resource name.
The attribute we mention at the end of key_name is key_name.
aws_key_pair.developer.key_name = this is the value of the key_name.


For the security groups we are associating the name and resource name of the security group.
The attribute we mention at the end of vpc_security_group_ids is "id".
aws_security_group.allow_tls.id = this is the value of the security_groups




