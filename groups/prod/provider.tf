
provider "google" {
  project                     = var.project_id
  impersonate_service_account = var.terraform_service_account
  request_timeout             = var.provider_request_timeout
  region                      = var.default_region
  billing_project             = var.project_id
  user_project_override       = true
}

provider "google-beta" {
  project                     = var.project_id
  impersonate_service_account = var.terraform_service_account
  request_timeout             = var.provider_request_timeout
  region                      = var.default_region
  billing_project             = var.project_id
  user_project_override       = true
}

