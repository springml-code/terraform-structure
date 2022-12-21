output "network" {
  value       = module.network.network
  description = "The created network"
}

output "subnets" {
  value       = module.network.subnets
  description = "A map with keys of form subnet_region/subnet_name and values being the outputs of the google_compute_subnetwork resources used to create corresponding subnets."
}

output "network_self_link" {
  value       = module.network.network_self_link
  description = "The URI of the VPC being created"
}

output "subnets_self_links" {
  value       = module.network.subnets_self_links
  description = "Self link of subnet"
}