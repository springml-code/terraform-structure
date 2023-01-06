
resource "google_folder" "spoke_project_root_folder" {
  display_name = var.spoke_folder
  parent       = var.parent_folder_id
}


resource "google_folder" "spoke_project_env_folders" {
  for_each     = var.env_folders
  display_name = each.value
  parent       = "folders/${google_folder.spoke_project_root_folder.folder_id}"

}


