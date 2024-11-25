#instance_type, policy_name value are passed from variables.tf in main folder

variable "instance_type" {}
variable "name" {}
variable "policy_name" {}
variable "hosted_zone_id" {}
#

vault = {
  instance_type = "t3.small"
  policy_name   = []
}