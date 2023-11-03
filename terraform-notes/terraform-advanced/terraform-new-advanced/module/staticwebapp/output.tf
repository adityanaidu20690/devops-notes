output "public-ip" {
  #   value = aws_instance.test["goku"].public_ip
#   value = [for key, value in aws_instance.test : value.public_ip]
value = aws_instance.test.public_ip
}
