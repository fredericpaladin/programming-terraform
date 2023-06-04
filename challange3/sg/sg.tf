variable "ingressports" {
  type = list(number)
  default = [80,443]
}

variable "egressports" {
  type = list(number)
  default = [80,443]
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

output "sg_name" {
  value =  aws_security_group.webtraffic.name
}