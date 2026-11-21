resource "aws_instance" "redis" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.redis.id]

  tags = {
    Name = "${var.component}-${var.environment}"
  }
}