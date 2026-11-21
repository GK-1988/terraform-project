# attaching one or commom security group for all four components

/* resource "aws_instance" "servers" {
  for_each = toset(var.components)

  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name        = each.key
    Component   = each.key
    Environment = var.environment
  }
} */

# Individual security group is attaching to respective component

resource "aws_instance" "servers" {
  for_each = toset(var.components)

  ami           = data.aws_ami.joindevops.id
  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.component_sg[each.key].id
  ]

  tags = {
    Name        = each.key
    Component   = each.key
    Environment = var.environment
  }
}