
resource "google_folder" "spoke_project_root_folder" {
  display_name = var.spoke_folder
  parent       = var.tn_data_folder_id
}


resource "google_folder" "spoke_project_env_folders" {
  for_each     = var.env_folders
  display_name = each.value
  parent       = "folders/${google_folder.spoke_project_root_folder.folder_id}"

}

module "non_prod_folder_iam_member" {
  source              = "../cloud_iam"
  folder_names        = [google_folder.spoke_project_env_folders["non-prod"].name]
  folder_iam_bindings = var.non_prod_folder_iam_bindings
}

module "prod_folder_iam_member" {
  source              = "../cloud_iam"
  folder_names        = [google_folder.spoke_project_env_folders["prod"].name]
  folder_iam_bindings = var.prod_folder_iam_bindings
}

