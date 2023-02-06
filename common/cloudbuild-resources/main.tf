module "cb_triggers" {
  source              = "../../modules/cloud_build"
  for_each            = { for k, v in var.cb_triggers : k => v }
  create_pull_trigger = each.value.trigger_type == "pull" ? true : false
  project_id          = var.project_id
  filename            = each.value.cloudbuild_yaml
  github_owner        = each.value.github_owner
  github_repo_name    = each.value.github_repo_name
  branch_name         = each.value.branch_name
  included_files      = each.value.included_files
  service_account_email     = var.ci_cd_service_account_email
  trigger_name = each.value.trigger_name
  description  = each.value.trigger_description
  substitutions = each.value.substitutions
}