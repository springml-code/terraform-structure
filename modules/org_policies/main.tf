module "org_policy" {
  source  = "terraform-google-modules/org-policy/google"
  version = "~> 3.0.2"

  allow             = var.allow
  allow_list_length = var.allow_list_length
  constraint        = var.constraint

  deny             = var.deny
  deny_list_length = var.deny_list_length

  policy_type      = var.policy_type
  organization_id  = var.organization_id
  enforce          = var.enforce
  exclude_folders  = var.exclude_folders
  exclude_projects = var.exclude_projects
  folder_id        = var.folder_id
  policy_for       = var.policy_for
  project_id       = var.project_id
}