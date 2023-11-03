resource "aws_instance" "first" {
#   ami           = var.ami[var.region]
#   ami = lookup(var.ami,var.region, "ami-default") # we use the lookup function to find the ami id from the region given
#if we have given wrong region not mention then it will take the default as ami
ami = try(var.ami[var.region],"ami-default") #we use the try block here
  instance_type = "t2.micro"

}



provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key

}

variable "access_key" {
  type    = string
  default = "AKIAWSJCOBW3HMXUIXCP"

}

variable "secret_key" {
  type    = string
  default = "XQdTgrgZ3qQZX7IxAPICJyfaRl7JNgj6c2A2sIeW"

}

variable "region" {
  type = string
  # default = "us-east-1"
validation {
  condition = contains(["us-east-1","us-west-1"],var.region)
  error_message = "Please enter the correct region"
}
}

variable "ami" {
  description = "this is the ami image"
  type        = map(any)
  default = {
    "us-east-1" = "ami-123456789"
    "us-west-1" = "ami-987654321"
  }

}
