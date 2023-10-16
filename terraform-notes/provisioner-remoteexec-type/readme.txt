here in this project we are using the type provisioner as remote-exec.


 provisioner "remote-exec" {
    inline = [
      "echo > /tmp/ip.txt" , 
      
      
    ]
connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("${path.module}/id_rsa")
    host        = "${self.public_ip}"
  }
  }

  for the remote exec we have speify the connection block.
  we have to mention the type and the private key path.

  ubder the remote exec provisioner we will be using the inline argument and we will give the list of commands to be executed.


provisioner "remote-exec" {
     script = "./testscript.sh"
 connection {
     type        = "ssh"
     user        = "ec2-user"
     private_key = file("${path.module}/id_rsa")
     host        = "${self.public_ip}"
   }
   }
Here instead of inline we are using the script argument and we have to specify the file nam.
the shell file mentioned here will be copied to the remote exec and will execute the command.

We can also use the argument like on_failure and when in the provisioner.