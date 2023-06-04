variable "instance_id" {
  type = string
}

resource "aws_eip" "elasticeip" {
  instance = var.instance_id
  vpc = true
}

output "eip" {
  value = aws_eip.elasticeip.public_ip
}
