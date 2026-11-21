resource "aws_instance" "mongodb" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.mongodb.id]

  tags = {
    Name = "mongodb"
  }
}