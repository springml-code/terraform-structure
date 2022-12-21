resource "google_app_engine_firewall_rule" "rule" {
  project      = var.project_id
  priority     = var.firewall_rule_config.priority
  action       = var.firewall_rule_config.action
  source_range = var.firewall_rule_config.source_range
  description  = var.firewall_rule_config.description
}