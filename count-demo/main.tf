provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  count = 3
  tags = {
    "Name" = "EC2 Instance"
  }
}
