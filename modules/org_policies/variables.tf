variable "policy_for" {
  description = "Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`."
  type        = string
}
variable "organization_id" {
  description = "The organization id for putting the policy"
  type        = string
  default     = null
}

variable "folder_id" {
  description = "The folder id for putting the policy"
  type        = string
  default     = null
}

variable "project_id" {
  description = "The project id for putting the policy"
  type        = string
  default     = null
}

variable "enforce" {
  description = "If boolean constraint, whether the policy is enforced at the root; if list constraint, whether to deny all (true) or allow all"
  type        = bool
  default     = null
}

variable "allow" {
  description = "(Only for list constraints) List of values which should be allowed"
  type        = list(string)
  default     = [""]
}

variable "deny" {
  description = "(Only for list constraints) List of values which should be denied"
  type        = list(string)
  default     = [""]
}

variable "exclude_folders" {
  description = "Set of folders to exclude from the policy"
  type        = set(string)
  default     = []
}

variable "exclude_projects" {
  description = "Set of projects to exclude from the policy"
  type        = set(string)
  default     = []
}

variable "constraint" {
  description = "The constraint to be applied"
  type        = string
}

variable "policy_type" {
  description = "The constraint type to work with (either 'boolean' or 'list')"
  type        = string
  default     = "list"
}

variable "allow_list_length" {
  description = "The number of elements in the allow list"
  type        = number
  default     = 0
}

variable "deny_list_length" {
  description = "The number of elements in the deny list"
  type        = number
  default     = 0
}