
variable "taxonomy_policy_tags" {
  type = map(object({
    id                     = string
    display_name           = string
    description            = optional(string)
    activated_policy_types = optional(list(string))
    policy_tags = optional(map(object({
      id           = string
      display_name = string
      description  = optional(string)
      level_one = optional(map(object({
        id           = string
        display_name = string
        parent_tag   = string
        description  = optional(string)
      }))),
      level_two = optional(map(object({
        id           = string
        display_name = string
        parent_tag   = string
        description  = optional(string)
      }))),
      level_three = optional(map(object({
        id           = string
        display_name = string
        parent_tag   = string
        description  = optional(string)
      }))),
      level_four = optional(map(object({
        id           = string
        display_name = string
        parent_tag   = string
        description  = optional(string)
      })))
    })))
  }))
  description = "(Required) A list of taxonomy and policy tags"

  validation {
    condition     = alltrue([for taxonomy in var.taxonomy_policy_tags : alltrue([for policy_type in lookup(taxonomy, "activated_policy_types", "POLICY_TYPE_UNSPECIFIED") : contains(["POLICY_TYPE_UNSPECIFIED", "FINE_GRAINED_ACCESS_CONTROL"], policy_type)])])
    error_message = "Supported policy types are 'FINE_GRAINED_ACCESS_CONTROL' and 'POLICY_TYPE_UNSPECIFIED'."
  }
}

variable "project" {
  type        = string
  description = "(Optional) The project ID to host the resource in"
}

variable "region" {
  type        = string
  description = "(Optional) The region to host the resource in"
}
