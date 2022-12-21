# https://github.com/terraform-google-modules/terraform-google-org-policy
module "org-policy-deny" {
  source = "../"

  constraint       = var.constraint
  deny             = var.deny
  deny_list_length = var.deny_list_length
  folder_id        = var.folder_id #Since enforcement is only allowed at the GCP Folder level
  policy_for       = var.policy_for
  policy_type      = var.policy_type
}

