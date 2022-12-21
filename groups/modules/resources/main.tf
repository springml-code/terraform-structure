locals {
  env = var.env == "dev" ? "-${var.env}" : ""
}

module "tn_data_groups" {
  for_each     = { for k, v in var.groups : k => v }
  source       = "../../../modules/groups"
  id           = "${each.value.role}${local.env}" #Group id
  display_name = each.value.display_name
  description  = each.value.description
  customer_id  = var.customer_id
  owners       = each.value.owners
  managers     = each.value.managers
  members      = each.value.members
}