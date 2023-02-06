variable "parent_type" {
  description = "Type of the parent resource. valid values are `organization`, `folder`, and `project`."
  type        = string

  validation {
    condition     = var.parent_type == "organization" || var.parent_type == "folder" || var.parent_type == "project"
    error_message = "For parent_type only `organization`, `folder`, and `project` are valid."
  }
}

variable "parent_id" {
  description = "ID of the parent resource."
  type        = string
}

variable "member" {
  description = "Member to have the given roles in the parent resource. Prefix of `group:`, `user:` or `serviceAccount:` is required."
  type        = string
}

variable "roles" {
  description = "Roles to grant to the member in the parent resource."
  type        = list(string)
}