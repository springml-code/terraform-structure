module "initial_folders" {
  source          = "../../modules/folder_factory"
  root_folders    = var.root_folders
  project_folders = var.project_folders
  organization_id = var.organization_id
}