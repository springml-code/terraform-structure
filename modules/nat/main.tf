module "cloud-nat" {
  source                             = "terraform-google-modules/cloud-nat/google"
  version                            = "~> 1.2"
  project_id                         = var.project_id
  name                               = var.name
  region                             = var.region
  router                             = var.router
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
  log_config_filter                  = var.log_config_filter
  log_config_enable                  = var.log_config_enable
}