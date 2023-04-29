module "cb_projects_triggers" {
  source                = "../../modules/cloud_build"
  for_each              = { for k, v in var.cb_resources_trigger : k => v }
  create_pull_trigger   = each.value.trigger_type == "pull" ? true : false
  project_id            = module.common_projects["cloud-build-common"].project_id
  filename              = each.value.cloudbuild_yaml
  github_owner          = each.value.github_owner
  github_repo_name      = each.value.github_repo_name
  branch_name           = each.value.branch_name
  included_files        = each.value.included_files
  service_account_email = google_service_account.terraform_foundation_sa["ci-cd"].email
  trigger_name          = each.value.trigger_name
  description           = each.value.trigger_description
  substitutions         = each.value.substitutions
  depends_on = [
    module.add_impersonation_on_foundation_sa
  ]
}