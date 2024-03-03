output "ecs_cluster_id" {
  value = module.ecs_cluster.cluster_id
}

output "services" {
  value = module.ecs_services.services
}

output "dns_records" {
  value = module.dns.records
}

