module "appengine-firewall" {
  source               = "../"
  for_each             = var.firewall_rules_config
  project_id           = var.project_id
  firewall_rule_config = each.value
}