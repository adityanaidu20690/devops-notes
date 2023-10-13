resource "aws_instance" "addy" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "${aws_key_pair.developer.key_name}"
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "first-instance"
  }
  # user_data = <<-EOF
  # #!/bin/bash
  # yum update -y
  # yum install httpd -y
  # systemctl enable httpd
  # systemctl start httpd
  # echo "hello world" > /var/www/html/index.html

  # EOF
  user_data = file("${path.module}/shell.sh")
}
