variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "trigger_name" {
  description = "Name of the trigger"
  type        = string
}

variable "description" {
  description = "Human-readable description of the trigger"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags for annotation of a BuildTrigger"
  type        = list(string)
  default     = null
}

variable "disabled" {
  description = "Whether the trigger is disabled or not"
  type        = bool
  default     = false
}

variable "substitutions" {
  description = "Substitutions data for Build resource"
  type        = map(string)
  default     = null
}

variable "service_account_email" {
  description = "The service account used for all user-controlled operations"
  type        = string
  default     = null
}

variable "include_build_logs" {
  description = "Build logs will be sent back to GitHub as part of the checkrun result"
  type        = string
  default     = "INCLUDE_BUILD_LOGS_WITH_STATUS"
}

variable "filename" {
  description = "Path, from the source root, to a file whose contents is used for the template"
  type        = string
}

variable "included_files" {
  description = "Changed files will trigger build"
  type        = list(string)
  default     = ["*"]
}

variable "github_owner" {
  description = "Owner of the repository"
  type        = string
}

variable "github_repo_name" {
  description = "Name of the repository"
  type        = string
}

variable "branch_name" {
  description = "Regex of branches to match"
  type        = string
}

variable "approval_required" {
  description = "Whether or not approval is needed"
  type        = bool
  default     = false
}

variable "create_pull_trigger" {
  description = "Create a pull request trigger"
  type        = bool
  default     = false
}