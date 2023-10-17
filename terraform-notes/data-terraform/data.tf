data "aws_ami" "linux" {
  most_recent = true

  owners = ["137112412989"]

  #Virtualization type = hvm
  #Root device type = EBS
  filter {
    name   = "name"
    values = ["${var.image_name}"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}