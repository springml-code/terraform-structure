module "dns-private-zone" {
  source     = "terraform-google-modules/cloud-dns/google"
  version    = "3.0.0"
  project_id = var.project_id
  type       = var.type
  name       = var.name
  domain     = var.domain

  private_visibility_config_networks = var.private_visibility_config_networks

  recordsets = var.recordsets
}