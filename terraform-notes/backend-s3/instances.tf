resource "aws_instance" "addy" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "${aws_key_pair.developer.key_name}"
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "first-instance"
  }

}

terraform {
  backend "s3" {
    bucket = "addy-bucket-786"
    key    = "terraform.tfstate"
    region = "us-east-1"
    
  }
} 
