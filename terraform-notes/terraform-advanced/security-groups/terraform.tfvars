instance_type = "t2.micro"
key_name      = "developer"

region        = "us-east-1"
ami = {

  "us-east-1" = "ami-03eb6185d756497f8"
  "us-west-1" = "ami-057f59841fdca7399"

}
key_path = "./id_rsa.pub"