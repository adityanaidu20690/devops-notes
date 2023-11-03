resource "aws_instance" "first" {
#   ami           = var.ami[var.region]
#   ami = lookup(var.ami,var.region, "ami-default") # we use the lookup function to find the ami id from the region given
#if we have given wrong region not mention then it will take the default as ami
ami = try(var.ami[var.region],"ami-default") #we use the try block here
  instance_type = var.Environment == "test" ? "t2.micro" :  "t2.large" # we are using this condition statement 
  #we have created a variable environment and we have given the values as prod and test 

}



provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key

}

variable "access_key" {
  type    = string
  default = ""

}

variable "secret_key" {
  type    = string
  default = ""

}

variable "region" {
  type = string
  # default = "us-east-1"
validation {
  condition = contains(["us-east-1" , "us-west-1"],var.region)
  error_message = "ENter the correct region"
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

variable "Environment" {
    type = string

    default = "test"
    description = "Environment variable"
    validation {
      condition = contains (["prod" , "test"],var.Environment)
      error_message = "enter the correct environment"
    }
  
}