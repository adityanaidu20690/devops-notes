here in this project we are using foreach


resource "aws_instance" "test" {
  for_each      = toset(["addy", "suji"])
  ami         = try(var.ami[var.region], "ami-default")
  instance_type = "t2.micro"
  tags = {
    Name = "${each.key}"
    # if you are iterating the map we will use each.value
    # if you are iterating the set we will use each.key
  }
 
}
