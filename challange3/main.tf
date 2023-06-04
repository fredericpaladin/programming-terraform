provider "aws" {
  region = "us-east-1"
}

module "dbModule" {
  source = "./db"
  ec2Name = "DB Server"
}

module "webModule" {
  source = "./web"
  ec2Name = "Web Server"
}

output "db_privateip" {
  value = module.dbModule.privateip
}

output "web_eip" {
  value = module.webModule.web_eip
}