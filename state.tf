# configure s3 backend for remote state storage

terraform {
  backend "s3" {
    bucket = "sri-d80-terraform"
    key    = "tools/terraform.tfstate"
    region = "us-east-1"
  }
}

