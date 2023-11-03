module "myfirtapp" {
# source = "./module/staticwebapp"
       source = "/root/terraform_modules/module/staticwebapp"
  ports = var.ports

  key-pair            = var.key-pair
  private_key_path    = var.private_key_path
  bootstrap_script    = var.bootstrap_script
  project_destination = var.project_destination
  project_files       = var.project_files
  secret_key          = var.secret_key
  instance_type       = var.instance_type
  region              = var.region
  access_key          = var.access_key
  key_name            = var.key_name
  environment         = terraform.workspace
  instance_size       = "t2.medium"
app_name= "test-project"
}
