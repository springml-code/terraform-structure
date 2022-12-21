project_id = ""

composer_env_name = ""

region = ""

labels = {
  // department = "test"
}

tags = [
  //  "foo",
  //  "bar"
]

network                                = ""
network_project_id                     = ""
subnetwork                             = ""
subnetwork_region                      = ""
pod_ip_allocation_range_name           = ""
service_ip_allocation_range_name       = ""
master_ipv4_cidr                       = ""
cloud_composer_network_ipv4_cidr_block = ""

airflow_config_overrides = {
  rbac_autoregister_per_folder_roles   = "True"
  rbac_user_registration_role          = "UserNoDags"
  composer_auth_user_registration_role = "UserNoDags"
}

env_variables = {
  // FOO = "bar"
}

image_version = "composer-2.0.28-airflow-2.2.5"

pypi_packages = {
  //  numpy = ""
  //  scipy = "==1.1.0"
}

enable_private_endpoint = false
// required when enable_private_endpoint = false
master_authorized_networks = [
  {
    cidr_block   = "0.0.0.0/0"
    display_name = "The world (Not a good idea)"
  }
]

web_server_allowed_ip_ranges = null // allow any

maintenance_start_time = "05:00" // UTC
maintenance_end_time   = null    // anytime
maintenance_recurrence = null    // any day of the year

environment_size = "ENVIRONMENT_SIZE_MEDIUM"

scheduler = {
  cpu        = 2
  memory_gb  = 7.5
  storage_gb = 5
  count      = 2
}

web_server = {
  cpu        = 2
  memory_gb  = 7.5
  storage_gb = 5
}

worker = {
  cpu        = 2
  memory_gb  = 7.5
  storage_gb = 5
  min_count  = 2
  max_count  = 6
}