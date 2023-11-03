here in this project we are creating the git hub repository using the terraform file.

to create the github repository using terraform file we will mention the provider as GITHUB.
to authenticate to create the github repo we will use the secret token wich we have created in github.

to create the repo we will use terraform apply --auto-approve acommand.
to check the providers in the files we use the command as terraform providers
terraform init command will install all the necessary plugin wrt the provider mentioned.
terraform plan command will show the preview of the repo to be created.
to delete the created repo we use terraform destroy command.

In our project we have created two repo's. If you want to delete any specific repo we will use the below command.
terraform destroy -target github_repository.<repository_name>