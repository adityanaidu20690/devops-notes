here in this projectwe are using provisioner.
The provisioner type which we used here is file.
using this provisioner we will transfer the file from the local to remote machine.
provisioner "file" {
    source = "readme.txt"
    destination = "/tmp/readme.txt"
    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = file("${path.module}/id_rsa")
      host = "${self.public_ip}"
    }

}
under source argument we will mention the source of the file.
under destination we will mention the file to be transferred in the remote machine.
under connection block we will give the type of connection and name of the user.
to connect to the remote machine we need the private key so here we will define the provate key.
Under Host we will give the instance details.