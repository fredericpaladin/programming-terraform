variable "ec2Name" {
  type = string
}

resource "aws_instance" "dbserver" {
  ami = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  tags = {
    "Name" = var.ec2Name
  }
}

output "privateip" {
  value = aws_instance.dbserver.private_ip
}