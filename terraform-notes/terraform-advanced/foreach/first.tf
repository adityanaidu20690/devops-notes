provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key

}


resource "aws_instance" "test" {
  for_each      = toset(["addy", "suji"])
  ami         = try(var.ami[var.region], "ami-default")
  instance_type = "t2.micro"
  tags = {
    Name = "${each.key}"
    # if you are iterating the map we will use each.value
    # if you are iterating the set we will use each.key
  }
 
}

resource "aws_key_pair" "developer" {
  key_name   = "developer"
  public_key = file(var.key_pair)
}
variable "key_pair" {
  description = "we will give a key pair"
  type        = string
   default     = "./id_rsa.pub"
  validation {
    condition     = fileexists(var.key_pair)
    error_message = "enter the key value"

  }
}
variable "region" {
  type    = string
  default = "us-east-1"
  validation {
    condition     = contains(["us-east-1", "us-west-1"], var.region)
    error_message = "Enter the correct region"
  }

}
variable "ami" {
  description = "we will give two ami images here"
  type        = map(any)
  default = {
    "us-east-1" = "ami-03eb6185d756497f8"
    "us-west-1" = "ami-057f59841fdca7399"
  }

}

variable "access_key" {
  type    = string
  default = "AKIAWSJCOBW3HMXUIXCP"

}

variable "secret_key" {
  type    = string
  default = "XQdTgrgZ3qQZX7IxAPICJyfaRl7JNgj6c2A2sIeW"

}


# variable "ami" {
#   description = "this is the ami image"
#   type        = map(any)
#   default = {
#     "us-east-1" = "ami-123456789"
#     "us-west-1" = "ami-987654321"
#   }

# }
variable "server-name" {
  description = "serversname are given here"
  type = list(string)
  default = [ "webserver"  ]
}