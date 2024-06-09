resource "aws_instance" "hello_world" {
  ami           = "ami-067aaeea6813afbde" 
  instance_type = "t2.micro"
  tags = {
    Name = "hello-world-nodejs"
  }

  # Configured the User Data Script to Install and Run Node.js App
  user_data = <<-EOF
      #!/bin/bash
      apt-get update
      apt-get install -y nodejs
      cd /home/ubuntu
      echo "console.log('Hello, World!')" > app.js
      nodejs app.js
      EOF
}
