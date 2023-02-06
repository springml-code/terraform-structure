variable "customer_id" {
  description = "Customer id of the organization to create the group in. One of domain or customer_id must be specified"
  type        = string
}

variable "env" {
  description = "Environment of the resource"
  type        = string
}

variable "groups" {
  type = map(object({
    role         = string
    description  = string
    display_name = string
    owners       = list(string)
    managers     = list(string)
    members      = list(string)

  }))
}