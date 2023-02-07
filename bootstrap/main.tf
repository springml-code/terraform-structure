module "bootstrap_setup" {
  source          = "./modules"
  root_folders    = var.root_folders
  project_folders = var.project_folders
  organization_id = var.organization_id
  # parent_folder      = local.parent_folder
  bootstrap_projects            = var.bootstrap_projects
  common_projects               = var.common_projects
  billing_account               = var.billing_account
  cb_resources_trigger = var.cb_resources_trigger
  foundation_sa_iam_bindings = var.foundation_sa_iam_bindings
}