the TFvars is used add the variables.
Earlier we used to pass the variable using the command using --var
We used to also pass the variable at the terminal.
Using this TFvars file we will mention the variables in the file. If you want to edit or change any value we have to just edit the tfvars file.

In this project you can see that we have given the variable username and age without mentioning any default value.
the values are mention is terraform.tfvars file


---------------------------
If you want to use a different tfvars for different env we have just chang the prefi of the .tfvars file
to make the new tfvars file applicable at the command line we write as
terraform plan --var-file=development.tfvars
If we do not mention the tfvars as the variable file it will automatically take the values of default file terraform.tfvars. 


