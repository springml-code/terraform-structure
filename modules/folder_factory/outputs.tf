
output "root_folder" {
  description = "Map (env-folder : env-folder-id) of Sub-folders created under the parent folder of spoke project"
  value       = { for k, v in var.root_folders : k => google_folder.root_folder[k].folder_id }
}

output "project_folders" {
  description = "Map (env-folder : env-folder-id) of Sub-folders created under the parent folder of spoke project"
  value       = { for name, folder_id in var.project_folders : name => google_folder.project_folders[name].folder_id }
}