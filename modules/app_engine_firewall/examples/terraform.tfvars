project_id = "test-project-01"

firewall_rules_config = {
  rule_1 = {
    source_range = "172.168.0.0/16"
    priority     = 1001
    action       = "ALLOW"
    description  = "This is a sample allow rule"
  }

  rule_2 = {
    source_range = "192.168.0.0/16"
    priority     = 1002
    action       = "DENY"
    description  = "This is a sample deny rule"

  }
}

    