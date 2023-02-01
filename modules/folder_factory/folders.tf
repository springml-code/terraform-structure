
resource "google_folder" "root_folder" {
  for_each     = { for k, v in var.root_folders : k => v }
  display_name = each.value
  parent       = "organizations/${var.organization_id}"
}


resource "google_folder" "project_folders" {
  for_each     = { for k, v in var.project_folders : k => v }
  display_name = each.key
  parent       = "folders/${google_folder.root_folder["project"].folder_id}"
}


