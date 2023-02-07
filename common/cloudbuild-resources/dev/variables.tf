variable "project_id" {
    type = string
    description = "Project ID"
}

variable "cb_triggers" {
  description = "Trigger for cb triggers"
  type        = map(object({
    trigger_type = string
    cloudbuild_yaml = string
    github_owner    = string
    github_repo_name = string
    branch_name      = string
    included_files   = list(string)
    trigger_name     = string
    trigger_description = string
    substitutions       = map(string)
  }))
}

variable "ci_cd_service_account_email" {
    description  = "CI CD service account"
    type = string
}