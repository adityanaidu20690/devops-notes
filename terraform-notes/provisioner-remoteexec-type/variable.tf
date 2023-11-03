variable "access_key" {
  type = string

}

variable "secret_key" {
  type = string
}

variable "region" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ports" {
  type = list(number)

}
