resource "aws_route53_record" "redis" {
  zone_id = data.aws_route53_zone.main.zone_id
  #name    = "redis.opsify.online"
  name = "${var.component}.${var.domain_name}"
  type = "A"
  ttl  = 1
  records = [
    aws_instance.redis.private_ip
  ]
}
