resource "aws_instance" "addy" {

  for_each        = toset(["addy"])
  ami             = try(var.ami[var.region], "ami-default")
  instance_type   = var.instance_type
  key_name        = aws_key_pair.addy-key.key_name
  vpc_security_group_ids  = [aws_security_group.addy-security.id]
  tags = {
    Name = "${each.key}"
  }
}