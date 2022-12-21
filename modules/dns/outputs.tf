output "dns_zone_name" {
  description = "DNS Zone name"
  value       = module.dns-private-zone.name
}

output "dns_domain" {
  description = "DNS zone domain"
  value       = module.dns-private-zone.domain
}