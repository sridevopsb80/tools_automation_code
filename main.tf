# using for_each loop in case additional tools will be added later

module "tool-infra-create" {
  for_each       = var.tools 
  source         = "./infra-create"
  name           = each.key # iterates name of the tools defined in variables.tf
  instance_type  = each.value["instance_type"]
  policy_name    = each.value["policy_name"]
  hosted_zone_id = var.hosted_zone_id
  ports          = each.value["ports"]
  volume_size    = each.value["volume_size"]
}