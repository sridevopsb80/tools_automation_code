# var tools is used to define the tools that are to be provisioned
#each.key value - github-runner
#each.value["instance_type"]


variable "tools" {
  type = map(object({
    instance_type = string
    policy_name   = list(string)
    ports         = map(number)
    volume_size   = number
  }))

  default = {
    github-runner = {
      instance_type = "t3.small"
      policy_name   = ["AdministratorAccess"]  # policy_name is a list. more policies can be added later.
      ports         = {}
      volume_size   = 20
    }

    vault = {
      instance_type = "t3.small"
      policy_name   = []
      ports = {
        vault = 8200 # defining port 8200 to be opened for vault
      }
      volume_size = 20
    }
   # minikube = {
#     instance_type = "t3.medium"
#     policy_name   = []
#     ports = {
#     kube = 8443
#       }
#     volume_size = 30
#     }
  }
}

variable "hosted_zone_id" {
  type    = string
  default = "Z02073473N3J0S3WVZG5G"
}