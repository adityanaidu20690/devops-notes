locals {
  # environment = terraform.workspace
  environment = var.environment
  tags = {
    Name = "sampleapp-${terraform.workspace}"
  }
}

resource "aws_instance" "test" {
  # for_each = toset(["goku"])
  # ami      = try(var.ami[var.region], "ami-default")
  ami = data.aws_ami.ami-test.id
    instance_type          = var.instance_size
  # instance_type          = local.environment == "test" ? "t2.micro" : "t2.large"
  vpc_security_group_ids = [aws_security_group.test-security.id]
  key_name               = aws_key_pair.developer.key_name
  tags = local.tags
  # tags = {
  #   Name = "${each.key}"
  # }
  # user_data = file(var.bootstrap_script)
  connection {
    user = "ec2-user"
    # user= "ubuntu"
    type        = "ssh"
    private_key = file(var.private_key_path)
    host        = self.public_ip

  }
  provisioner "remote-exec" {
    script = var.bootstrap_script

  }
  provisioner "file" {

    source = var.project_files
    # destination = "/var/www/html/"
    destination = var.project_destination
  }


}


