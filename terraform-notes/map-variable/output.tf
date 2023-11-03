
output "user" {
  value = "the age of addy is ${lookup(var.userage, "addy")}  "
}