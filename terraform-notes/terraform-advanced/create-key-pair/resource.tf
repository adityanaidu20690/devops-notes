resource "aws_instance" "addy" {
#   ami = var.ami
for_each = toset(["addy" , "suji"])
  ami = try(var.ami[var.region] , "ami-default")
  instance_type = var.instance_type
  key_name = aws_key_pair.addy-key.key_name

  tags = {
    Name = "${each.key}"
  }
}