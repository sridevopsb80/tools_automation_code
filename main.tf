#each.key value is github-runner as defined in variables.tf

module "tool-infra-create" {
  for_each      = var.tools
  source        = "./infra-create"
  name          = each.key
  instance_type = each.value["instance_type"]
}