output "root_folder" {
  description = "Map (env-folder : env-folder-id) of Sub-folders created under the parent folder of spoke project"
  value       = module.initial_folders.root_folder
}

output "project_folders" {
  description = "Map (env-folder : env-folder-id) of Sub-folders created under the parent folder of spoke project"
  value       = module.initial_folders.project_folders
}

output "project_id" {
  description = "Project IDs"
  value       = { for name, details in module.bootstrap_projects : name => details["project_id"] }
}
output "bucket_names" {
  description = "name of the project state bucket"
  value       = { for name, details in module.bootstrap_projects : name => details["bucket_name"] }
}
output "bucket_urls" {
  description = "Self link of the project bucket"
  value       = { for name, details in module.bootstrap_projects : name => details["bucket_url"] }
}

output "foundation_service_account_email" {
  description = "Foundations service account email"
  value       = { for name, details in google_service_account.terraform_foundation_sa : name => details["email"] }
}