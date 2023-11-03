here in this project we are using terraform backend.
terraform backend is used to save the terraform.tfstate file.
This is used because if there are multiple people working on same project and if them use terraform apply at same time than the olderterraform.tfstate file will 
be replaced with new one.
To avoid this we will use the backend as s3 and save the terraform.tfstate file.

terraform {
  backend "s3" {
    
    bucket = "addy-bucket-786"
    key    = "terraform.tfstate"
    region = "us-east-1"
    
  }
} 

we will use this block at the top of the project.
here we are specifying the bucket name and also the region.
Under key we will give the name of the file to be saved.
