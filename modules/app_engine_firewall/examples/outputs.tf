output "firewall-rules-added" {
  value = { for k, v in module.appengine-firewall : k => v.firewall-rule-id }
}
