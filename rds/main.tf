provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "myRds" {
  db_name = "mydb"
  identifier = "my-first-rds"
  instance_class = "db.t2.micro"
  engine = "mariadb"
  engine_version = "10.6.8"
  username = "admin123"
  password = "password123"
  port = 3306
  allocated_storage = 20
  skip_final_snapshot = true
}