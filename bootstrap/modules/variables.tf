variable "policy_for" {
  description = "Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`."
  type        = string
}

# Folder creation
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

variable "parent_folder" {
  description = "Project parent folder"
  type        = string
}

