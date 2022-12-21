resource "google_cloudbuild_trigger" "pull_request_trigger" {
  count       = var.create_pull_trigger ? 1 : 0
  project     = var.project_id
  name        = var.trigger_name
  description = var.description
  tags        = var.tags
  disabled    = var.disabled

  substitutions      = var.substitutions
  service_account    = var.service_account
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
  count       = var.create_pull_trigger ? 0 : 1
  project     = var.project_id
  name        = var.trigger_name
  description = var.description
  tags        = var.tags
  disabled    = var.disabled

  substitutions      = var.substitutions
  service_account    = var.service_account
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
