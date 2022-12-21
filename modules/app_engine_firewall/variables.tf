variable "project_id" {
  type        = string
  description = "The project ID in which the service will be enabled"
}

variable "firewall_rule_config" {
  type = object({
    source_range = string
    priority     = number
    action       = string
    description  = string
  })
  description = "the configuration of firewall rule in a map to be added to app engine"
}
