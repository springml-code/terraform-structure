output "project_id" {
  description = "Project Id of the created project"
  value       = module.project_factory.project_id
}

output "project_number" {
  description = "Project number"
  value       = module.project_factory.project_number
}

output "bucket_name" {
  description = "name of the project state bucket"
  value       = local.project_state_bucket_name
}
output "bucket_url" {
  description = "Self link of the project bucket"
  value       = module.state_bucket.*.url
}

output "service_account_email" {
  description = "Project default service account email"
  value       = module.project_factory.service_account_email
}