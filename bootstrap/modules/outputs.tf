output "root_folder" {
  description = "Map (env-folder : env-folder-id) of Sub-folders created under the parent folder of spoke project"
  value       = module.initial_folders.root_folder
}

output "project_folders" {
  description = "Map (env-folder : env-folder-id) of Sub-folders created under the parent folder of spoke project"
  value       = module.initial_folders.project_folders
}

output "tf_project_id" {
  description = "Project IDs"
  value       = module.bootstrap_projects["terraform-project-common"].project_id
}

output "cloudbuild_project_id" {
  description = "Project IDs"
  value       = module.common_projects["cloud-build-common"].project_id
}

output "tf_bucket_name" {
  description = "name of the TF project state bucket"
  value       = module.bootstrap_projects["terraform-project-common"].bucket_name
}
output "tf_bucket_url" {
  description = "Self link of the TF project bucket"
  value       = module.bootstrap_projects["terraform-project-common"].bucket_url
}

output "cloudbuild_bucket_name" {
  description = "name of the cloud build project state bucket"
  value       = module.common_projects["cloud-build-common"].bucket_name
}
output "cloudbuild_bucket_url" {
  description = "Self link of the cloud build project bucket"
  value       = module.common_projects["cloud-build-common"].bucket_url
}

output "foundation_service_account_email" {
  description = "Foundations service account email"
  value       = { for name, details in google_service_account.terraform_foundation_sa : name => details["email"] }
}