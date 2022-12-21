output "instance_self_links" {
  description = "List of self-links for compute instances"
  value       = module.compute_instance.instances_self_links
}

output "instance_details" {
  description = "List of all details for compute instances"
  value       = module.compute_instance.instances_details
}

output "instance_available_zones" {
  description = "List of available zones in region"
  value       = module.compute_instance.available_zones
}

