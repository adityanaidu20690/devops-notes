here in this project we are using Remote Backend State Locking using S3 and DynamoDB.
terraform backend is used to save the terraform.tfstate file.
This is used because if there are multiple people working on same project and if them use terraform apply at same time than the olderterraform.tfstate file will 
be replaced with new one.
To avoid this we will use the backend as s3 and save the terraform.tfstate file.

we are using the dynamo db from aws.
first we will create a dynamo db in AWS.
while creating the dynamo db we will give the name of the dynamo db and also we have to mention as LockID in partion key.

we are using this because when there are mutiple people working on same project and when both of them using the command
terraform apply at the same time than the changes done to the infrastructure might be mixed up. to avoid this we use
dynamo db so when one of the team member selectes terraform apply automatically the data will be saved to dynamo db and
when another member will also use terraform apply then it will give a message that already their has been a member working on it
and to work after the infra has been created by first user.




terraform {
  backend "s3" {
    dynamodb_table = "addy-xlr8"
    bucket = "addy-bucket-786"
    key    = "terraform.tfstate"
    region = "us-east-1"
    
  }
} 

we will use this block at the top of the project.
here we are specifying the bucket name and also the region.
Under key we will give the name of the file to be saved.
dynamodb_table argument is used to specify the name of the dynamo db table.


Note: when you give the backend and dynamodb we have to use terraform init.