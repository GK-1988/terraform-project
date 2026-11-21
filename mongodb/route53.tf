resource "aws_route53_record" "mongodb" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "mongodb.opsify.online"
  type    = "A"
  ttl     = 1
  records = [
    aws_instance.mongodb.private_ip
    ]
}
