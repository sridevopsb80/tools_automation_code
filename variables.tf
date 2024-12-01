#defining github-runner as the tool with t3.small as the instance type
#each.key value - github-runner
#each.value["instance_type"]

variable "tools" {
  default = {
    github-runner = {
      instance_type = "t3.small"
      policy_name = [
        "AdministratorAccess"
        #Although we are referencing and provisioning (a pre-existing AWS policy) Administrator access to github-runner here, this is not good practice.
        # we can add more policies under policy_name. when we do, it will become a list variable.
        # When provisioning another tool, the policy name can be changed based on the desired access.

      ]
      ports = {}
      # not defining any specific port to open for github-runner
    }
    vault = {
      instance_type = "t3.small"
      policy_name   = []
      ports = {
        vault = 8200
        # defining port 8200 to be opened for vault
      }
    }
  }

}

variable "hosted_zone_id" {
  default = "Z02073473N3J0S3WVZG5G"
}