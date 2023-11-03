resource "aws_key_pair" "developer" {
  public_key = file("${var.key-pair}")
#  key_name   = var.key_name
key_name = local.key_name
}
