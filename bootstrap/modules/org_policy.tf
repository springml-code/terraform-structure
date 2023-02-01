module "enforce_org_policies" {
  for_each    = toset(local.org_policies)
  source      = "../../modules/org_policies"
  policy_for  = var.policy_for
  folder_id   = module.initial_folders.root_folder["project"]
  constraint  = each.value
  policy_type = "boolean"
  enforce     = true
}