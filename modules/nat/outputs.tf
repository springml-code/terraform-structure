output "name" {
  description = "Name of the Cloud NAT"
  value       = module.cloud-nat.name
}

output "region" {
  description = "Cloud NAT region"
  value       = module.cloud-nat.region
}
