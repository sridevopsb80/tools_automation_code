#defining aws ami RHEL-9-DevOps-Practice as a datasource

data "aws_ami" "rhel9" {
  most_recent = true
  name_regex  = "Redhat-9-DevOps-Practice" #name of the ami
  owners      = ["973714476881"]
}