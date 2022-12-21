// https://github.com/terraform-google-modules/terraform-google-composer/tree/master/modules/create_environment_v2
module "composer" {
  source  = "terraform-google-modules/composer/google//modules/create_environment_v2"
  version = "3.3.0"

  project_id        = var.project_id
  composer_env_name = var.composer_env_name
  region            = var.region
  labels            = var.labels

  environment_size = var.environment_size

  network    = var.network
  subnetwork = var.subnetwork

  // these two are required for Shared VPC usage
  network_project_id = var.network_project_id
  subnetwork_region  = var.subnetwork_region

  composer_service_account = var.composer_service_account
  tags                     = var.tags
  enable_ip_masq_agent     = var.enable_ip_masq_agent

  // ip_allocation_policy
  pod_ip_allocation_range_name     = var.pod_ip_allocation_range_name
  service_ip_allocation_range_name = var.service_ip_allocation_range_name

  // software_config
  airflow_config_overrides = var.airflow_config_overrides
  pypi_packages            = var.pypi_packages
  env_variables            = var.env_variables
  image_version            = var.image_version

  // private_environment_config
  use_private_environment                = var.use_private_environment
  enable_private_endpoint                = var.enable_private_endpoint
  master_ipv4_cidr                       = var.master_ipv4_cidr
  cloud_sql_ipv4_cidr                    = var.cloud_sql_ipv4_cidr
  cloud_composer_network_ipv4_cidr_block = var.cloud_composer_network_ipv4_cidr_block
  cloud_composer_connection_subnetwork   = var.cloud_composer_connection_subnetwork

  // maintenance_window
  maintenance_start_time = var.maintenance_start_time
  maintenance_end_time   = var.maintenance_end_time
  maintenance_recurrence = var.maintenance_recurrence

  scheduler = var.scheduler

  web_server = var.web_server

  worker = var.worker

  master_authorized_networks = var.master_authorized_networks
}

