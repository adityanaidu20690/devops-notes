variable "region" {
  description = "project available in both the regios us east and west"
  type        = string
  validation {
    condition     = contains(["us-east-1", "us-west-1"], var.region)
    error_message = "enter the correct region"
  }
    # default = "us-east-1"
}

variable "access_key" {
  type = string

}

variable "secret_key" {
  type = string


}

variable "instance_type" {
  type = string
  #   default = "t2.micro"
}

variable "ami" {
  description = "our project works on both the regions"
  type        = string
    # default = "ami-03eb6185d756497f8"
  default = {
      "us-east-1" = "ami-03eb6185d756497f8"
      "us-west-1" = "ami-057f59841fdca7399"
  }
}

variable "key_name" {
  type = string
  # default = "developer"
}

variable "key_path" {
  description = "details of the keypair"
  type        = string
  # default = "./id_rsa.pub"
  validation {
    condition     = fileexists(var.key_path)
    error_message = "enter the correct path"
  }

}