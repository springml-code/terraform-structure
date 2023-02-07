resource "google_service_account" "terraform_foundation_sa" {
  for_each = local.granular_sa

  project      = each.value.project
  account_id   = "sa-terraform-${each.key}"
  display_name = each.value.detail
}

module "add_impersonation_on_foundation_sa" {
    source = "../../modules/cloud_iam/service_account_iam"
    for_each = local.granular_sa
    service_accounts = [google_service_account.terraform_foundation_sa[each.key].email]
    project_id = each.value.project
    bindings = var.foundation_sa_iam_bindings
}

module "add_impersonation_on_foundation_cicd_sa" {
    source = "../../modules/cloud_iam/service_account_iam"
    for_each = local.granular_sa
    service_accounts = [google_service_account.terraform_foundation_sa["ci-cd"].email]
    project_id = module.common_projects["cloud-build-common"].project_id
    bindings = {
        "roles/iam.serviceAccountTokenCreator" = [
            "serviceAccount:${google_service_account.terraform_foundation_sa[each.key].email}"
        ]
    }
}

module "org_iam_member" {
  source   = "../../modules/parent_iam"
  for_each = local.granular_sa_org_level_roles

  member      = "serviceAccount:${google_service_account.terraform_foundation_sa[each.key].email}"
  parent_type = "organization"
  parent_id   = var.organization_id
  roles       = each.value
}

module "folder_iam_member" {
  source   = "../../modules/parent_iam"
  for_each = local.granular_sa_folder_level_roles

  member      = "serviceAccount:${google_service_account.terraform_foundation_sa[each.key].email}"
  parent_type = "folder"
  parent_id   = module.initial_folders.root_folder["project"]
  roles       = each.value
}

module "common_tf_project_iam_member" {
  source   = "../../modules/parent_iam"
  for_each = local.granular_sa_common_tf_project

  member      = "serviceAccount:${google_service_account.terraform_foundation_sa[each.key].email}"
  parent_type = "project"
  parent_id   = module.bootstrap_projects["terraform-project-common"].project_id
  roles       = each.value
}

module "cicd_project_iam_member" {
  source   = "../../modules/parent_iam"
  for_each = local.granular_sa_cicd_project

  member      = "serviceAccount:${google_service_account.terraform_foundation_sa[each.key].email}"
  parent_type = "project"
  parent_id   = module.common_projects["cloud-build-common"].project_id
  roles       = each.value
}

// When the bootstrap projects are created, the Compute Engine
// default service account is disabled but it still has the Editor
// role associated with the service account. This default SA is the
// only member with the editor role.
// This module will remove all editors from both projects.
# module "bootstrap_projects_remove_editor" {
#   source   = "./modules/parent-iam-remove-role"
#   for_each = local.bootstrap_projects

#   parent_type = "project"
#   parent_id   = each.value
#   roles       = ["roles/editor"]

#   depends_on = [
#     module.seed_project_iam_member,
#     module.cicd_project_iam_member
#   ]
# }

resource "google_project_iam_binding" "iam_remove" {
  for_each = local.initial_projects

  project = each.value
  role    = "roles/editor"
  members = []
}

resource "google_billing_account_iam_member" "tf_billing_user" {
  for_each = local.granular_sa

  billing_account_id = var.billing_account
  role               = "roles/billing.user"
  member             = "serviceAccount:${google_service_account.terraform_foundation_sa[each.key].email}"

  depends_on = [
    google_service_account.terraform_foundation_sa
  ]
}