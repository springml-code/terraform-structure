variable "tag_templates" {
  type = map(object({
    id           = string
    display_name = optional(string)
    force_delete = optional(bool)
    fields = map(object({
      id           = string
      type         = string
      values       = optional(list(string))
      description  = optional(string)
      display_name = optional(string)
      is_required  = optional(bool)
      order        = optional(number)
    }))
  }))
  description = "(Required) A list of tag template resource objects"

  validation {
    condition     = can([for tag_template in var.tag_templates : regex("^[a-z_][a-z0-9_]{0,63}$", tag_template.id)])
    error_message = "Each of the 'tag_templates' id values must start with a letter (a-z) or underscore (_) and only contain letters (a-z), numbers(0-9) or underscores(_). It can be at most 64 bytes long when encoded in UTF-8."
  }

  validation {
    condition     = can([for tag_template in var.tag_templates : regex("^[^\\s][a-zA-Z0-9_\\s]{0,199}[^\\s]$", tag_template.display_name)])
    error_message = "Each of the 'tag_templates' display names must NOT start or end with a space. It must contain only unicode letters, numbers, underscores, dashes and spaces. It can be at most 200 bytes long when encoded in UTF-8."
  }

  validation {
    condition     = alltrue([for tag_template in var.tag_templates : alltrue([for field in tag_template.fields : contains(["BOOL", "DOUBLE", "ENUM", "STRING", "TIMESTAMP"], field.type)])])
    error_message = "Supported types are 'BOOL', 'DOUBLE', 'ENUM', 'STRING' and 'TIMESTAMP'."
  }

  validation {
    condition     = alltrue([for tag_template in var.tag_templates : alltrue([for field in tag_template.fields : length(regexall("^[a-zA-Z_][a-zA-Z0-9_]{0,63}$", field.id)) > 0])])
    error_message = "Field IDs must start with a letter or underscore. Field IDs must be unique within their template. Field IDs must be at least 1 character long and at most 64 bytes long when encoded in UTF-8."
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
