# $1 value can be the ip address or the dns name of the server we wish to connect to


# shellcheck disable=SC2296
ansible-playbook -i $1, tool-setup.yml -e ansible_user=${{ secrets.SSH_USER }} -e ansible_password=${{ secrets.SSH_PWD }} -e tool_name=github-runner