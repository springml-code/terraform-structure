module "bootstrap_setup" {
  source             = "./modules"
  policy_for         = "folder"
  root_folders       = var.root_folders
  project_folders    = var.project_folders
  organization_id    = var.organization_id
  # parent_folder      = local.parent_folder
  bootstrap_projects = var.bootstrap_projects
  billing_account    = var.billing_account
  bootstrap_folder_iam_bindings = var.bootstrap_folder_iam_bindings
}