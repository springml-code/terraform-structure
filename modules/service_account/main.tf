

module "service_account" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~> 4.1.1"
  project_id    = var.project_id
  prefix        = ""
  names         = [var.name]
  display_name  = var.display_name
  description   = var.description
  project_roles = var.project_roles
}