module "enforce_org_policies" {
  for_each    = local.org_policies
  source      = "../../modules/org_policies"
  policy_for  = each.value.policy_for
  folder_id   = each.value.folder_id 
  project_id  = each.value.project_id
  constraint  = each.value.constraint
  policy_type = "boolean"
  enforce     = each.value.value
}