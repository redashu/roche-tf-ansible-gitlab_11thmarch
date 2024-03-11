# we can define multiple section of providers like aws , azure , git , docker
resource "aws_instance" "ashu-vm1" {
  ami           = var.my-ami
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ashu-key-gen.key_name
  tags = {
    Name = "ashutoshh-linuxvm"
  }
  # file provisioner to transfer file from tf machine to target 
    provisioner "file" {
        source = "my-scripts/web.sh" # local location 
        destination = "/tmp/web.sh" # remote location 
    }
  # define provisioner here 
    provisioner "remote-exec" {
      #script = "/tmp/web.sh" # to execute script 
      inline = [ 
        "chmod +x /tmp/web.sh",
        "bash /tmp/web.sh"
        ]
    }
    # we can define connection details here 
    connection {
      type = "ssh"
      user = "ec2-user"
      host = self.public_ip
      timeout = "3m"
      # below line is using private key content 
      private_key = tls_private_key.ashu-algo.private_key_pem
      # below line is using privte key file 
      #private_key = file("ashu-key.pem")
    }


}

