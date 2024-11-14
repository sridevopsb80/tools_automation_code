#copying relevant info from learn-terraform->10-remote-state->main.tf and editing values
#tools is the var defined under variables.tf

terraform {
  backend "s3" {
    bucket = "sri-d80-terraform"
    key    = "tools/terraform.tfstate"
    region = "us-east-1"
  }
}

