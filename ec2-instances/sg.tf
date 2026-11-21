
# commom security group for all four components

/* resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "allow all traffic"

  tags = {
    Name = "allow_all"
    Environment = var.environment
}

} */


# individual security group for each component and inline egress rule.

resource "aws_security_group" "component_sg" {
  for_each = toset(var.components)

  name        = "${each.key}-sg"
  description = "${each.key} security group"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${each.key}-sg"
    Component   = each.key
    Environment = var.environment
  }
}


resource "aws_vpc_security_group_ingress_rule" "component_port" {
  for_each = toset(var.components)

  security_group_id = aws_security_group.component_sg[each.key].id

  from_port   = var.ports[each.key]
  to_port     = var.ports[each.key]
  ip_protocol = "tcp"
  cidr_ipv4   = "0.0.0.0/0"
}


resource "aws_vpc_security_group_ingress_rule" "ssh" {
  for_each = toset(var.components)

  security_group_id = aws_security_group.component_sg[each.key].id

  
  from_port   = var.ports["ssh"]
  to_port     = var.ports["ssh"]
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
}

/* resource "aws_vpc_security_group_egress_rule" "all_outbound" {
  for_each = toset(var.components)

  security_group_id = aws_security_group.component_sg[each.key].id

  ip_protocol = "-1"

  cidr_ipv4 = "0.0.0.0/0"
} */