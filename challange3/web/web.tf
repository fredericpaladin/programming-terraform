variable "ec2Name" {
  type = string
}

resource "aws_instance" "webserver" {
  ami = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  security_groups = [module.sg.sg_name]
  user_data = file("./web/server-script.sh")
  tags = {
    "Name" = var.ec2Name
  }
}

module "eip" {
  source = "../eip"
  instance_id = aws_instance.webserver.id
}

module "sg" {
  source = "../sg"
}

output "web_eip" {
  value = module.eip.eip
}