locals {
  service_account_project_id = var.service_account_project_id == null ? var.project_id : var.service_account_project_id
  service_account = var.service_account_email == null ? "" : "projects/${var.service_account_project_id}/serviceAccounts/${var.service_account_email}"
}
resource "google_cloudbuild_trigger" "pull_request_trigger" {
  count       = var.create_pull_trigger ? 1 : 0
  project     = var.project_id
  name        = var.trigger_name
  description = var.description
  tags        = var.tags
  disabled    = var.disabled

  substitutions      = var.substitutions
  service_account    = local.service_account
  include_build_logs = var.include_build_logs

  filename       = var.filename
  included_files = var.included_files

  github {
    owner = var.github_owner
    name  = var.github_repo_name
    pull_request {
      branch = var.branch_name
    }
  }

  approval_config {
    approval_required = var.approval_required
  }
}

resource "google_cloudbuild_trigger" "push_trigger" {
  provider    = google-beta
  count       = var.create_pull_trigger ? 0 : 1
  project     = var.project_id
  name        = var.trigger_name
  description = var.description
  tags        = var.tags
  disabled    = var.disabled

  substitutions      = var.substitutions
  service_account    = local.service_account
  include_build_logs = var.include_build_logs

  filename       = var.filename
  included_files = var.included_files

  github {
    owner = var.github_owner
    name  = var.github_repo_name
    push {
      branch = var.branch_name
    }
  }

  approval_config {
    approval_required = var.approval_required
  }
}
