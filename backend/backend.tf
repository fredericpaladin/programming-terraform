terraform {
  backend "s3" {
    key = "tfstate.tfstate"
    bucket = "f-paladin-terraform"
    region = "us-east-1"
    access_key = ""
    secret_key = ""
  }
}