#defining github-runner as the tool with t3.small as the instance type
#each.key value - github-runner
#each.value - t3.small

variable "tools" {
  default = {
    github-runner = {
      instance_type = "t3.small"
    }
  }
}