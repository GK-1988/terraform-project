resource "aws_route53_record" "servers" {
  for_each = aws_instance.servers

  zone_id = data.aws_route53_zone.main.zone_id
  name    = "${each.key}.${var.domain_name}"

  type = "A"
  ttl  = 1

  records = [
    each.value.private_ip
  ]
}
