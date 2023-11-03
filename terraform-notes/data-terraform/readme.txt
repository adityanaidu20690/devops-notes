here in this project we have used the data source to update the ami ID.
we are making the code to automatically select ami ID from AWS console instead of updating manually.

In this project we have used the datasource block. we have specified it in data.tf file

In the data block we have mentioned the owner ID of the ami and under filter we are specifying the name of the ami ID and also the type of data needed.



After speifying the details we will mention the same in the resource block for creating the instance. 
"${data.aws_ami.linux.id}"