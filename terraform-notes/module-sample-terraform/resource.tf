

module "instance" {
  source = "./module/webserver"
  ami_id                  = var.ami_id
  instance_type          = var.instance_type
  
  key   = file("${path.module}/id_rsa.pub")  
  key_name = "${var.key_name}"
}

# output "mypublicIp" {
#   value = module.webserver.public_ip
  
# }

output "mypublicIp" {
  value = module.instance.publicIp
  
}
# resource "aws_key_pair" "developer" {
#   key_name   = "developer"
#   public_key = file("${path.module}/id_rsa.pub")
# }


# resource "aws_security_group" "allow_tls" {
#   name        = "allow_tls"
#   description = "Allow TLS inbound traffic"
#   dynamic "ingress" {
#     for_each = [80, 443, 22]
#     iterator = port
#     content {
#       description = "TLS from VPC"
#       from_port   = port.value
#       to_port     = port.value
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]

#     }
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#     # ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = "addy-security"
#   }
# }
