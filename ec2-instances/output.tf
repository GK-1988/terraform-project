output "private_ips" {
  value = {
    for k, v in aws_instance.servers :
    k => v.private_ip
  }
}


output "public_ips" {
  value = {
    for k, v in aws_instance.servers :
    k => v.public_ip
  }
}


output "instance_ids" {
  value = {
    for k, v in aws_instance.servers :
    k => v.id
  }
}

output "environment" {
  value = var.environment
}


output "fqdn" {
  value = [
    for component in var.components :
    "${component}.${var.domain_name}"
  ]
}