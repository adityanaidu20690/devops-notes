Map variable using dynamic value:

we will use the map variable
to find a value in the map variable we use "lookup" function.

here in this project we will use the the map variable.
in the output.tf file we are using the lookup function to find the age of the given name.

If we want to pass the value through the command line

terraform plan -var "username=<name>" -var "userage={"key":value}"