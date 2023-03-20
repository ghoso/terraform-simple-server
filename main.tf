provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "example" {
  ami = "ami-067871d950411e643"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello World !" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  user_data_replace_on_change = true

  tags = {
    "Name" = "terraform-example"
  }
}

resource "aws_security
