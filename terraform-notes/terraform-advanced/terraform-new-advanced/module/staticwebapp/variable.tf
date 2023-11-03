variable "access_key" {
  type = string

}

variable "secret_key" {
  type = string

}

variable "instance_type" {
  type = string
  # default = "t2.micro"

}

# variable "ami" {
#   type        = map(any)
#   description = "giving the details of the ami"
#   # default = {
#   #   "us-east-1" = "ami-03eb6185d756497f8"
#   #   "us-west-1" = "ami-057f59841fdca7399"
#   # }

# }

variable "region" {
  type        = string
  description = "enter the region"
  #   default = "us-east-1"
  validation {
    condition     = contains(["us-east-1", "us-west-1"], var.region)
    error_message = "enter the correct region"
  }
}

variable "environment" {
  description = "we will give different environments"
  type        = string
#   default = terraform.workspace
  # validation {
  #   condition     = contains(["prod", "test"], var.environment)
  #   error_message = "enter the correct env"
  # }

}

variable "key-pair" {
  description = "enter the path of the key pair"
  type        = string
  # default = "./id_rsa.pub"
  validation {
    condition     = fileexists(var.key-pair)
    error_message = "enter the correct path of the key"
  }

}

variable "key_name" {
  description = "enter the name of the key pair"
  type        = string

}

variable "ports" {
  description = "ports for the machine"
  type        = any

}


variable "bootstrap_script" {
  type        = string
  description = "the script will run at the time of startup"
  validation {
    condition     = fileexists(var.bootstrap_script)
    error_message = "bootstrap script not found"
  }
}

variable "private_key_path" {
  type        = string
  description = "enter the private key"
  validation {
    condition     = fileexists(var.private_key_path)
    error_message = "enter the correct path"
  }

}

variable "project_files" {
  description = "path of the project file"
  type = string
  # default = "./src"
}

variable "project_destination" {
  type = string
  description = "project destination"
  default = "/usr/share/nginx/html"
}

variable "instance_size" {
  description = "instance size"
  type = string
  default = "t2.micro"

}
