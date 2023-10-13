output "maximum" {
  value= "the maximum value of ${var.max1} , ${var.max2} , ${var.max3} is ${max(var.max1 , var.max2 , var.max3)}"
# value= "${var.maxi}"
}

output "minimum" {
  value= "the manimum value of ${var.max1} , ${var.max2} , ${var.max3} is ${min(var.max1 , var.max2 , var.max3)}"
# value= "${var.maxi}"
}

output "square" {
  value = "the square of ${var.pow1} is ${pow(var.pow1 , var.pow2)}"
}