variable "zone_name" {}
variable "ecs_services" {}

resource "aws_route53_zone" "main" {
  name = var.zone_name
}

resource "aws_route53_record" "service" {
  count   = length(var.ecs_services)
  zone_id = aws_route53_zone.main.zone_id
  name    = var.ecs_services[count.index].dns_alias
  type    = "CNAME"
  ttl     = 300
  records = [module.ecs_services.services[count.index].load_balancer_dns_name]
}

output "records" {
  value = aws_route53_record.service[*].fqdn
}

