module "network" {
  source  = "terraform-google-modules/network/google"
  version = "~> 4.0"

  project_id   = var.project_id
  network_name = var.network_name
  routing_mode = var.routing_mode
  subnets      = var.subnets

  secondary_ranges = var.secondary_ranges

  routes         = var.routes
  firewall_rules = var.firewall_rules
}

resource "google_compute_global_address" "private_services" {
  provider = google-beta

  # using for_each in case we need to reorder or remove a range
  # When two arguments are given with a list, the first is the index
  for_each = { for k, v in var.private_services_cidrs : k => v }

  # Left side of / in the cidr is the starting IP address
  address = element(split("/", each.key), 0)

  address_type = "INTERNAL"
  description  = each.value.description

  name    = each.value.ip_address_range_name
  network = module.network.network_self_link

  # Right side of / in the cidr is the prefix length
  prefix_length = element(split("/", each.key), 1)

  project = var.project_id
  purpose = each.value.ip_address_purpose
}

resource "google_service_networking_connection" "private_services_dev" {
  count                   = var.create_vpc_peering ? 1 : 0
  network                 = module.network.network_id
  reserved_peering_ranges = [for range in google_compute_global_address.private_services : range.name]
  service                 = "servicenetworking.googleapis.com"
}