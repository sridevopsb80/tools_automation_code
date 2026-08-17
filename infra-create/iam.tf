# creating an iam role(github-runner-role) to be attached to the github runner server

resource "aws_iam_role" "role" {
  name = "${var.name}-role"
  # modeling this role after a pre-existing role - workstation role. 
  # go to trust relationship version and statement info in that role to fill in the info below. 
  # name = github-runner-role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  tags = {
    tag-key = "${var.name}-role"
  }
}

# Instance profile is a wrapper for ec2 roles
# they do not contain the permission themselves
# they point to ec2 roles
# they are attached to ec2 instances
resource "aws_iam_instance_profile" "instance-profile" {
  name = "${var.name}-role"
  role = aws_iam_role.role.name
}

# attaching policy
# count is being used since policy_name could be made a list variable.
resource "aws_iam_role_policy_attachment" "policy-attach" {
  count      = length(var.policy_name)
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/${var.policy_name[count.index]}"
  # policy_arn info is obtained from aws policy AdministratorAccess.
  # policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
