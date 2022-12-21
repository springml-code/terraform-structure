output "groups_id" {
  value       = module.groups.id
  description = "ID of the TN data prod groups"
}

output "resource_name" {
  value       = module.groups.resource_name
  description = "Resource name of the prod groups created"
}