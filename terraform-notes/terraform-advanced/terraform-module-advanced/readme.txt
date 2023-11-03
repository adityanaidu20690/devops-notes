here in this project we are using modules.
modueles is  a set of Terraform configuration files in a single directory.
By using modules, you can organize your configuration into logical components.
so here we have moved the main code in the modules.
and in our project folder we are giving the variable values of needed variables

module "myfirtapp" {
      source = "./module/staticwebapp"
      
  ports  = var.ports

  key-pair            = var.key-pair
  private_key_path    = var.private_key_path
  bootstrap_script    = var.bootstrap_script
  project_destination = var.project_destination
  project_files       = var.project_files
  secret_key = var.secret_key
  instance_type = var.instance_type
  region = var.region
  access_key = var.access_key
  key_name = var.key_name
  environment = var.environment
  instance_size = var.instance_size
}

to access the module we will give the value to the aattribute source.
the value of the source will be the path of the module.
we will use the needed variable names as per the project.
