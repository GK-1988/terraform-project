resource "aws_security_group" "mongodb" {
  name        = "mongodb-sg"
  description = "Security Group for MongoDB"

  tags = {
    Name = "mongodb-sg"
  }
}


resource "aws_vpc_security_group_ingress_rule" "mongodb-ssh" {
  security_group_id = aws_security_group.mongodb.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
}


resource "aws_vpc_security_group_ingress_rule" "mongodb-port" {
  security_group_id = aws_security_group.mongodb.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 27017
  to_port     = 27017
  ip_protocol = "tcp"
}


resource "aws_vpc_security_group_egress_rule" "mongodb_outbond" {
  security_group_id = aws_security_group.mongodb.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  to_port     = 0
  ip_protocol = "tcp"
}
