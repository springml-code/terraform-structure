output "id" {
  value       = { for k, v in module.tn_data_groups : k => v.id }
  description = "ID of the TN data dev groups"
}

output "resource_name" {
  value       = { for k, v in module.tn_data_groups : k => v.resource_name }
  description = "Resource name of the dev groups created"
}