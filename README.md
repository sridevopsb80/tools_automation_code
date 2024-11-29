# To setup tools via automation

# Refer to Infra-create folder to see EC2 Instance, Route53, Security groups creation and attaching IAM role policy and Instance profile ARN.

## To install github-runner in remote machine using ansible

````
ansible-playbook -i <Remote host IP where you want github-runner installed>, tool-setup.yml -e ansible_user=ec2-user -e ansible_password=DevOps321 -e tool_name=github-runner
````
