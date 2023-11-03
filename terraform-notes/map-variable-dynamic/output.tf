output "user" {
  value = "the age of ${var.username} is ${lookup(var.userage, "${var.username}")}  "
} 