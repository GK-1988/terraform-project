resource "aws_security_group" "redis" {
  #name = "redis-sg"
  name        = "${var.component}-sg"
  description = "Security Group for redis"

  tags = {
    #Name = redis-sg
    Name        = "${var.component}-sg"
    Environment = var.environment
  }
}


/* resource "aws_vpc_security_group_ingress_rule" "redis_inbound" {
  count             = length(var.ports)
  security_group_id = aws_security_group.redis.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = var.ports[count.index]
  to_port     = var.ports[count.index]
  ip_protocol = "tcp"
} */

# for_each support maps and set of strings only, not numbers. if we use numbers, make sure to convert numbers into string
/* resource "aws_vpc_security_group_ingress_rule" "redis_inbound" {
  for_each = toset(var.ports)
  security_group_id = aws_security_group.redis.id
    
  from_port   = tonumber(each.value)
  to_port     = tonumber(each.value)
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
} */


resource "aws_vpc_security_group_ingress_rule" "redis_inbound" {
  for_each = var.ports
  security_group_id = aws_security_group.redis.id
    
  from_port   = each.value
  to_port     = each.value
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
}



resource "aws_vpc_security_group_egress_rule" "redis_outbond" {
  security_group_id = aws_security_group.redis.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  to_port     = 0
  ip_protocol = "tcp"
}
