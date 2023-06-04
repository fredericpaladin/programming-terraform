provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
}

resource "aws_eip" "elasticeip" {
  instance = aws_instance.ec2.id
  vpc = true
}

output "eip" {
  value = aws_eip.elasticeip.public_ip
}