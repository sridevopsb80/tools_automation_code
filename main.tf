#using a for_each loop in case variable tools will have multiple entries later on

#each.key value is github-runner as defined in variables.tf

module "tool-infra-create" {
  for_each      = var.tools
  source        = "./infra-create"
  name          = each.key
  instance_type = each.value["instance_type"]
  policy_name   = each.value["policy_name"]
  hosted_zone_id = var.hosted_zone_id
}