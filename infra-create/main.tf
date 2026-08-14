# aws ami info fetched from aws using data.tf

resource "aws_instance" "tool" {
  ami                    = data.aws_ami.rhel9.image_id
  instance_type          = var.instance_type # refer variables.tf in main folder
  vpc_security_group_ids = [aws_security_group.tool-sg.id]
  iam_instance_profile   = aws_iam_instance_profile.instance-profile.name
  instance_market_options {
    market_type = "spot"
    spot_options {
      instance_interruption_behavior = "stop"
      spot_instance_type             = "persistent"
    }
  }
  root_block_device {
    volume_size = var.volume_size
  }
  tags = {
    Name = var.name # tool name. refer variables.tf in main folder
  }
}

# creating aws security group for tools

resource "aws_security_group" "tool-sg" {
  name        = "${var.name}-sg" # tool name-sg. 
  description = "${var.name}-sg"

# all outbound ports allowed
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

# only tcp port 22 allowed. protocol has to be specified as TCP
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  # Creating dynamic blocks - https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks

  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port        = ingress.value #(vault port is defined as 8200)
      to_port          = ingress.value #(vault port is defined as 8200)
      protocol         = "TCP"
      cidr_blocks      = ["0.0.0.0/0"]
      description = ingress.key #(ingress.key = vault)

  }
  }

  tags = {
    Name = "${var.name}-sg" 
  }
}


#creating public and private aws route53 records for external and internal use
resource "aws_route53_record" "record-public" {
  zone_id = var.hosted_zone_id
  name    = var.name
  type    = "A"
  ttl     = 10
  records = [aws_instance.tool.public_ip]
}
resource "aws_route53_record" "record-private" {
  zone_id = var.hosted_zone_id
  name    = "${var.name}-internal"
  type    = "A"
  ttl     = 10
  records = [aws_instance.tool.private_ip]
}