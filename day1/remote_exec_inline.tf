# we can define multiple section of providers like aws , azure , git , docker
resource "aws_instance" "ashu-vm1" {
  ami           = var.my-ami
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ashu-key-gen.key_name
  tags = {
    Name = "ashutoshh-linuxvm"
  }
  # define provisioner here 
    provisioner "remote-exec" {
      inline = [ 
        # write steps to install httpd server and host a static webpage 
        "sudo yum update -y" ,
        "sudo yum install httpd git -y" ,
       " cd /tmp",
       "git clone https://github.com/schoolofdevops/html-sample-app.git" ,
        "sudo cp -rf html-sample-app/*  /var/www/html/",
        "sudo systemctl enable --now httpd" 
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

