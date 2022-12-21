# https://github.com/terraform-google-modules/terraform-google-org-policy
module "org-policy" {
  source  = "terraform-google-modules/org-policy/google"
  version = "~> 3.0.2"

  #Attributes start here
  allow             = var.allow
  allow_list_length = var.allow_list_length
  constraint        = var.constraint
  deny              = var.deny
  deny_list_length  = var.deny_list_length
  enforce           = var.enforce
  exclude_folders   = var.exclude_folders
  exclude_projects  = var.exclude_projects
  folder_id         = var.folder_id #Since enforcement is only allowed at the GCP Folder level
  policy_for        = var.policy_for
  policy_type       = var.policy_type
}

