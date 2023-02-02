################# variables for creating folders #############################

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

variable "bootstrap_folder_iam_bindings" {
  description = "Map of role (key) and list of members (value) to add the IAM policies/bindings"
  type        = map(list(string))
}
