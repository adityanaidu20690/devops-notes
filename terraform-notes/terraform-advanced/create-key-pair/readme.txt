here in this project we are creating a key-pair for the instance created.

resource "aws_key_pair" "addy-key" {
  key_name = var.key_name
  public_key = file(var.key_path)
}

here in this block we are creating the key pair resources and the name of the resource is addy-key.
in key_name attribute we will give the name of the key.
in the attribute key_name = we have given the variable name we can check the value in terraform.tfvars

in public_key attribute we are using the file function and inside file function we are giving the path of the key.
