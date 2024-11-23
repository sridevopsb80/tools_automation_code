# To setup tools via automation

## To install github-runner in remote machine using ansible

````
ansible-playbook -i <Remote host IP where you want github-runner installed>, tool-setup.yml -e ansible_user=ec2-user -e ansible_password=DevOps321 -e tool_name=github-runner
````
