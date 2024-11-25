#creating an iam role to be attached to the github runner server

resource "aws_iam_role" "role" {
  name = "${var.name}-role"
  #go to the corresponding iam role(workstation role)->trust relationship version and statement info
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
resource "aws_iam_role_policy_attachment" "policy-attach" {
  count      = length(var.policy_name)
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/${var.policy_name["count.index"]}"
}
