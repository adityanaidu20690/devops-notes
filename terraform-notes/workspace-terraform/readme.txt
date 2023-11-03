here in this project we are creating separate workspace
to create a work space we use the command terraform workspace
terraform workspace list -- shows the workspace created.
terraform workspace new -- creates a new workspace
terraform workspace select <name-of the-workspace> -- We can change from one workspace to another workspace
terraform workspace delete <workspace-name> -- we can delete the workspace.

Usually in realtime env we will be having multiple environment. So we will have to create a terraform.tfvars file for 
different env.
here in the project we have 2 tfvars file.
terraform.tfvars
dev-terraform.tfvars

to use the tfvars file we use the command terraform apply -var-file=tfvar file


terraform.tf file is used to give the version of terraform and version of aws provider