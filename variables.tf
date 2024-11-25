#defining github-runner as the tool with t3.small as the instance type
#each.key value - github-runner
#each.value["instance_type"]

variable "tools" {
  default = {
    github-runner = {
      instance_type = "t3.small"
      policy_name = [
        "AdministratorAccess" #Administrator access is an existing policy in aws policies. we are not defining a new policy, just using an existing one.
      ]
    }
  }
}