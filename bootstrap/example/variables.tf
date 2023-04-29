variable "root_folders" {
  description = "Name of the root folders for the project"
  type        = map(string)
}

variable "project_folders" {
  description = "List of sub folders under the parent spoke-project folder"
  type        = map(string)
}

variable "organization_id" {
  description = "Organization ID"
  type        = string
}

variable "bootstrap_projects" {
  description = "Projects under bootstrap folder"
  type = map(object({
    apis            = list(string)
    project_sa_name = string
  }))
}

variable "common_projects" {
  description = "Projects under shared folder"
  type = map(object({
    apis            = list(string)
    project_sa_name = string
  }))
}

variable "billing_account" {
  description = "Billing account"
  type        = string
}

variable "cb_resources_trigger" {
  description = "Trigger for shared projects"
  type = map(object({
    trigger_type        = string
    cloudbuild_yaml     = string
    github_owner        = string
    github_repo_name    = string
    branch_name         = string
    included_files      = list(string)
    trigger_name        = string
    trigger_description = string
    substitutions       = map(string)
  }))
}

variable "foundation_sa_iam_bindings" {
  description = "Map of role (key) and list of members (value) to add the IAM policies/bindings"
  type        = map(list(string))
  default     = {}
}