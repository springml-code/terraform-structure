variable "terraform_service_account" {
  description = "Terraform bootstrap service account"
  type        = string
}

variable "project_id" {
  type        = string
  description = "Specify the project id"
}

variable "default_region" {
  description = "Default region to create resources where applicable."
  type        = string
  default     = "us-central1"
}

variable "provider_request_timeout" {
  description = "Request timeput for the google provider"
  type        = string
  default     = "60s"
}


variable "domain" {
  description = "Domain of the organization to create the group in. One of domain or customer_id must be specified"
  # equals to tn.gov. SA does not require organization.viewer if we use customerID
  default = "C02wkm4hs"
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

variable "env" {
  description = "Dev environment"
  type        = string
}
