



resource "aws_instance" "addy" {
    ami                    = "${data.aws_ami.linux.id}"
  instance_type          = "${var.instance_type}"
  key_name               = "${aws_key_pair.developer.key_name}"
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "first-instance"
  }

}


output "ami_id" {
  value = data.aws_ami.linux.id

}