#defining aws ami RHEL-9-DevOps-Practice as a datasource

data "aws_ami" "rhel9" {
  most_recent = true
  name_regex  = "RHEL-9-DevOps-Practice"
  owners      = ["973714476881"]
}