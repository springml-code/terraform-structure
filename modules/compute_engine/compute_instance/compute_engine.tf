
module "compute_instance" {
  source                    = "terraform-google-modules/vm/google//modules/compute_instance"
  version                   = "7.9.0"
  access_config             = var.access_config
  add_hostname_suffix       = var.add_hostname_suffix
  alias_ip_ranges           = var.alias_ip_ranges
  deletion_protection       = var.deletion_protection
  hostname                  = var.hostname
  hostname_suffix_separator = var.hostname_suffix_separator
  instance_template         = var.instance_template
  network                   = var.network
  num_instances             = var.num_instances
  region                    = var.region
  resource_policies         = var.resource_policies
  static_ips                = var.static_ips
  subnetwork                = var.subnetwork
  subnetwork_project        = var.subnetwork_project
  zone                      = var.zone
}