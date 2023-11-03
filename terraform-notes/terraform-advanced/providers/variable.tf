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
#   default = [ "webserver"  ]
}