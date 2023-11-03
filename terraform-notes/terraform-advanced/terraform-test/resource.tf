resource "aws_instance" "test" {
  # we are using the foreach to give multpile names of the servers.
  for_each = toset(["goku"])
#we have used try to allow the code to select the ami as per the given region
  ami      = try(var.ami[var.region], "ami-default")
  #   instance_type          = var.instance_type
  #we are using the ternary operator to set the environment.
  instance_type          = var.environment == "test" ? "t2.micro" : "t2.large"
  vpc_security_group_ids = [aws_security_group.test-security.id]
  key_name               = aws_key_pair.developer.key_name
  tags = {
    Name = "${each.key}"
  }
  # user_data = file(var.bootstrap_script)
  connection {
    user        = "ec2-user"
    # user= "ubuntu"
    type        = "ssh"
    private_key = file(var.private_key_path)
    host        = self.public_ip

  }
  provisioner "remote-exec" {
    script = var.bootstrap_script

  }
  provisioner "file" {
#source of the code
    source      = "./src"
    # destination = "/var/www/html/"
    #destination of where the file to available
    destination = "/usr/share/nginx/html"
  }


}


