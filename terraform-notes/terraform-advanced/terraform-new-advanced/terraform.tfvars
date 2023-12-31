
instance_type = "t2.micro"
region        = "us-west-1"
# environment   = "test"
#environment = terraform.workspace
key-pair = "./id_rsa.pub"
key_name = "developer"
# ami = {
#   "us-east-1" = "ami-01eccbf80522b562b"
#   #   "us-east-1" = "ami-0261755bbcb8c4a84"   #ubuntu ami image
#   "us-west-1" = "ami-057f59841fdca7399"
# }
ports = [
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

bootstrap_script    = "./addy.sh"
private_key_path    = "./id_rsa"
project_files       = "./src"
project_destination = "/usr/share/nginx/html"