data "aws_ami" "ami-test" {
  most_recent = true
  owners      = [137112412989]


  filter {
    name  = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20231020.1-x86_64-gp2"]
  }

#   filter {
#     name   = "root-device type"
#     values = ["ebs"]
#   }

#   filter {
#     name   = "vitualization-type"
#     values = ["hvm"]
#   }
}
