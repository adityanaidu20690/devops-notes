resource "aws_key_pair" "developer" {
  key_name   = "developer"
  public_key = file("${path.module}/id_rsa.pub")
}