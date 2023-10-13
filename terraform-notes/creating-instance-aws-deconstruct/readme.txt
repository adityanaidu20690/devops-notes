Here in this project we have deconstructed the file.
we have separated the resources , providers, key, variable, security and terraform.tfvars
in terraform.tfvars file we will mention the variables.
In variable.tf file we will mention the variables.
for defining the access key and security key we will set the env varables.

We have tried to install the httpd service and also change the content of index.html
We have created a sh so that we can defile the commands to be run at user data level.
in the resourse on the instance.tf we have added the user_data attribute and specified the path of shell.sh file.
using file function and path module we have specified the path of shell.sh file.

resource "aws_instance" "addy" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "${aws_key_pair.developer.key_name}"
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "first-instance"
  }
   user_data = <<-EOF
  !/bin/bash
   yum update -y
   yum install httpd -y
   systemctl enable httpd
   systemctl start httpd
   echo "hello world" > /var/www/html/index.html

   EOF

}

we can give the userdata like above.

resource "aws_instance" "addy" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "${aws_key_pair.developer.key_name}"
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "first-instance"
  }

  user_data = file("${path.module}/shell.sh")
}


we can also specify by using the file function