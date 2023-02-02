output "root_folder" {
  description = "Map (env-folder : env-folder-id) of Sub-folders created under the parent folder of spoke project"
  value       = module.initial_folders.root_folder
}

output "project_folders" {
  description = "Map (env-folder : env-folder-id) of Sub-folders created under the parent folder of spoke project"
  value       = module.initial_folders.project_folders
}

output "tf_bucket_name" {
  description = "name of the project state bucket"
  value       = module.bootstrap_projects["terraform-project"].bucket_name
}
output "tf_bucket_url" {
  description = "Self link of the project bucket"
  value       = module.bootstrap_projects["terraform-project"].bucket_url
}

output "tf_service_account_email" {
  description = "Project default service account email"
  value       = module.bootstrap_projects["terraform-project"].service_account_email
}