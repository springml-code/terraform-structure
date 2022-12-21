
output "spoke_folder" {
  description = "Parent folder created for the spoke project"
  value       = google_folder.spoke_project_root_folder.folder_id
}

output "env_folders" {
  description = "Map (env-folder : env-folder-id) of Sub-folders created under the parent folder of spoke project"
  value       = { for env in var.env_folders : env => google_folder.spoke_project_env_folders[env].folder_id }
}