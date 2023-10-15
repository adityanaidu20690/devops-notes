Here in this project we are using the provisioner as local-exec.
local-exec will execute the command in the local machine.
so here we are using this provisioner type as local-exec.
The provisioner will be under the instance resource block.

provisioner "local-exec" {  #we are using the command argument 
  when = destroy
    command = "echo hello > test.txt"  #we are using the echo command and we are transferring the data to a new file.
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip} > test2.txt" #we are finding the IP address of the machine created.
  }
  provisioner "local-exec" {
    when = destroy
 command = "env > env.txt"
 environment = {  #we declaring the environment variable by giving the environment block
   envname = "envvalue"
 }    
  }

under provisioner block we use the argument as when.
in when we will specify when the provisioner will be executed.
in the given block we have specified the argument of when as destroy.
So here this provisioner will executed when we use terraform destroy command.


We also can specify the name of the environment by using the environment block.
the attribute of envname can be speified.