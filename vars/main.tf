provider "aws" {
  region = "us-east-1"
}

variable "number_of_servers" {
  type = number
}

resource "aws_instance" "ec2" {
  ami           = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  count         = var.number_of_servers
  tags = {
    "Name" = "EC2 Instance"
  }
}
