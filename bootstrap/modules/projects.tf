module "bootstrap_projects" {
  for_each          = { for k, v in var.bootstrap_projects : k => v }
  source            = "../../modules/project"
  project_name      = each.key
  random_project_id = true
  org_id            = var.organization_id
  billing_account   = var.billing_account
  activate_apis     = each.value.apis

  folder_id            = module.initial_folders.root_folder["bootstrap"]
  project_sa_name      = each.value.project_sa_name
}