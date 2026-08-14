# var tools is used to define the tools that are to be provisioned

#each.key value - github-runner
#each.value["instance_type"]

variable "tools" {
  default = {
    github-runner = {
      instance_type = "t3.small"
      policy_name = [
        "AdministratorAccess"
        # Although we are referencing and provisioning (a pre-existing AWS policy) 
        # Administrator access to github-runner here, this is not good practice.
        # policy_name is a list. more values can be added later.
        # When provisioning another tool, add the appropriate policy name based on the desired access.

      ]
      ports = {}
      # not defining any specific port to open for github-runner
      volume_size = 20
    }
    vault = {
      instance_type = "t3.small"
      policy_name   = []
      ports = {
        vault = 8200
        # defining port 8200 to be opened for vault
      }
      volume_size = 20
    }
#     minikube = {
#       instance_type = "t3.medium"
#       policy_name   = []
#       ports = {
#         kube = 8443
#       }
#       volume_size = 30
#     }
  }
}

variable "hosted_zone_id" {
  default = "Z02073473N3J0S3WVZG5G"
}