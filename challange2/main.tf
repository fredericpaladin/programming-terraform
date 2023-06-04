provider "aws" {
  region = "us-east-1"
}

variable "ingressports" {
  type = list(number)
  default = [80,443]
}

variable "egressports" {
  type = list(number)
  default = [80,443]
}

resource "aws_instance" "dbserver" {
  ami = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  tags = {
    "Name" = "DB Server"
  }
}

resource "aws_instance" "webserver" {
  ami = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]
  user_data = file("server-script.sh")
  tags = {
    "Name" = "Web Server"
  }
}

resource "aws_eip" "elasticeip" {
  instance = aws_instance.webserver.id
  vpc = true
}

resource "aws_security_group" "webtraffic" {
  name = "Web Server Security Group"
  dynamic "ingress" {
    iterator = port
    for_each = var.ingressports
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    iterator = port
    for_each = var.egressports
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  vpc_id = "vpc-e5648f83"
}

output "eip" {
  value = aws_eip.elasticeip.public_ip
}

output "privateip" {
  value = aws_instance.dbserver.private_ip
}