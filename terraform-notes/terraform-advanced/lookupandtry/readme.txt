Here in this project we are trying to use both the functions:
try and lookup
ami = lookup(var.ami,var.region, "ami-default") 
we use the lookup function to find the ami id from the region given
if we have given wrong region not mention then it will take the default as ami.

ami = try(var.ami[var.region],"ami-default") 
we use the try block here
we are giving the variable as var.ami and in that variable ami we are giving the value as var.region 
which mean that when we use the command terraform plan. 
it will ask to enter the region.
the code will searh the given region in ami variable and if it matches the region then it will creat a instance with that ami.
