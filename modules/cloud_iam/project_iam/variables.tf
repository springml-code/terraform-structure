variable "project_iam_mode" {
  description = "Mode for adding the IAM policies/bindings, additive and authoritative"
  default     = "additive"
  type        = string
}

variable "project_names" {
  description = "Projects list to add the IAM policies/bindings"
  default     = []
  type        = list(string)
}

variable "project_iam_bindings" {
  description = "Map of role (key) and list of members (value) to add the IAM policies/bindings"
  type        = map(list(string))
  default     = {}
}

variable "project_conditional_bindings" {
  description = "List of maps of role and respective conditions, and the members to add the IAM policies/bindings"
  type = list(object({
    role        = string
    title       = string
    description = string
    expression  = string
    members     = list(string)
  }))
  default = []
}