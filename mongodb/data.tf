data "aws_route53_zone" "main" {
  name         = "opsify.online"
  private_zone = false
}


