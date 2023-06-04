provider "aws" {
  region = "us-east-1"
}

module "ec2Module" {
  source = "./ec2"
  ec2Name = "Name from module"
}

output "module_output" {
  value = module.ec2Module.instance_id
}