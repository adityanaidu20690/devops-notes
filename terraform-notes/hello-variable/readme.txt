In this project we have will be using variables to the script.

syntax for writing a variable block

variable "lable-name"{

}


in our project we have deconstructed and divided the vaiable and output into two files.

-----To give a variable in non-interavtive mode we have to give as below:
terraform plan -var "<variable-lablename>=<varialbe-value>" 


for adding muti variables we have to write a new variable block under variable.tf 

-----To give a variable in non-interavtive mode we have to give as below:
terraform plan -var "<variable-lablename>=<varialbe-value>"  -var "<variable-lablename>=<varialbe-value>"


in variable block type will specify the type of the variable
in variable block default will give the default value specified if no expression is passed