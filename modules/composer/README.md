## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.8.0, < 5.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 4.8.0, < 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 4.8.0, < 5.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | >= 4.8.0, < 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_composer"></a> [composer](#module\_composer) | terraform-google-modules/composer/google//modules/create_environment_v2 | 3.3.0 |

## Resources

| Name | Type |
|------|------|
| [google-beta_google_composer_environment.composer_env](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_composer_environment) | resource |
| [google_project_iam_member.composer_agent_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_airflow_config_overrides"></a> [airflow\_config\_overrides](#input\_airflow\_config\_overrides) | Airflow configuration properties to override. Property keys contain the section and property names, separated by a hyphen, for example "core-dags\_are\_paused\_at\_creation". | `map(string)` | `{}` | no |
| <a name="input_cloud_composer_connection_subnetwork"></a> [cloud\_composer\_connection\_subnetwork](#input\_cloud\_composer\_connection\_subnetwork) | When specified, the environment will use Private Service Connect instead of VPC peerings to connect to Cloud SQL in the Tenant Project | `string` | `null` | no |
| <a name="input_cloud_composer_network_ipv4_cidr_block"></a> [cloud\_composer\_network\_ipv4\_cidr\_block](#input\_cloud\_composer\_network\_ipv4\_cidr\_block) | The CIDR block from which IP range in tenant project will be reserved. | `string` | `null` | no |
| <a name="input_cloud_sql_ipv4_cidr"></a> [cloud\_sql\_ipv4\_cidr](#input\_cloud\_sql\_ipv4\_cidr) | The CIDR block from which IP range in tenant project will be reserved for Cloud SQL. | `string` | `null` | no |
| <a name="input_composer_env_name"></a> [composer\_env\_name](#input\_composer\_env\_name) | Name of Cloud Composer Environment | `string` | n/a | yes |
| <a name="input_composer_service_account"></a> [composer\_service\_account](#input\_composer\_service\_account) | Service Account for running Cloud Composer. | `string` | `null` | no |
| <a name="input_enable_ip_masq_agent"></a> [enable\_ip\_masq\_agent](#input\_enable\_ip\_masq\_agent) | Deploys 'ip-masq-agent' daemon set in the GKE cluster and defines nonMasqueradeCIDRs equals to pod IP range so IP masquerading is used for all destination addresses, except between pods traffic. | `bool` | `false` | no |
| <a name="input_enable_private_endpoint"></a> [enable\_private\_endpoint](#input\_enable\_private\_endpoint) | Configure public access to the cluster endpoint. | `bool` | `false` | no |
| <a name="input_env_variables"></a> [env\_variables](#input\_env\_variables) | Variables of the airflow environment. | `map(string)` | `{}` | no |
| <a name="input_environment_size"></a> [environment\_size](#input\_environment\_size) | The environment size controls the performance parameters of the managed Cloud Composer infrastructure that includes the Airflow database. Values for environment size are: ENVIRONMENT\_SIZE\_SMALL, ENVIRONMENT\_SIZE\_MEDIUM, and ENVIRONMENT\_SIZE\_LARGE. | `string` | `"ENVIRONMENT_SIZE_MEDIUM"` | no |
| <a name="input_grant_sa_agent_permission"></a> [grant\_sa\_agent\_permission](#input\_grant\_sa\_agent\_permission) | Cloud Composer relies on Workload Identity as Google API authentication mechanism for Airflow. | `bool` | `true` | no |
| <a name="input_image_version"></a> [image\_version](#input\_image\_version) | The version of the aiflow running in the cloud composer environment. https://cloud.google.com/composer/docs/concepts/versioning/composer-versions | `string` | `"composer-2.0.28-airflow-2.2.5"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | The resource labels (a map of key/value pairs) to be applied to the Cloud Composer. | `map(string)` | `{}` | no |
| <a name="input_maintenance_end_time"></a> [maintenance\_end\_time](#input\_maintenance\_end\_time) | Time window specified for recurring maintenance operations in RFC3339 format | `string` | `null` | no |
| <a name="input_maintenance_recurrence"></a> [maintenance\_recurrence](#input\_maintenance\_recurrence) | Frequency of the recurring maintenance window in RFC5545 format. | `string` | `null` | no |
| <a name="input_maintenance_start_time"></a> [maintenance\_start\_time](#input\_maintenance\_start\_time) | Time window specified for daily or recurring maintenance operations in RFC3339 format | `string` | `"05:00"` | no |
| <a name="input_master_authorized_networks"></a> [master\_authorized\_networks](#input\_master\_authorized\_networks) | List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists). | <pre>list(object({<br>    cidr_block   = string<br>    display_name = string<br>  }))</pre> | `[]` | no |
| <a name="input_master_ipv4_cidr"></a> [master\_ipv4\_cidr](#input\_master\_ipv4\_cidr) | The CIDR block from which IP range in tenant project will be reserved for the master. | `string` | `null` | no |
| <a name="input_network"></a> [network](#input\_network) | The VPC network to host the composer cluster. | `string` | n/a | yes |
| <a name="input_network_project_id"></a> [network\_project\_id](#input\_network\_project\_id) | The project ID of the shared VPC's host (for shared vpc support) | `string` | `""` | no |
| <a name="input_pod_ip_allocation_range_name"></a> [pod\_ip\_allocation\_range\_name](#input\_pod\_ip\_allocation\_range\_name) | The name of the cluster's secondary range used to allocate IP addresses to pods. | `string` | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID where Cloud Composer Environment is created. | `string` | n/a | yes |
| <a name="input_pypi_packages"></a> [pypi\_packages](#input\_pypi\_packages) | Custom Python Package Index (PyPI) packages to be installed in the environment. Keys refer to the lowercase package name (e.g. "numpy"). | `map(string)` | `{}` | no |
| <a name="input_region"></a> [region](#input\_region) | Region where the Cloud Composer Environment is created. | `string` | n/a | yes |
| <a name="input_scheduler"></a> [scheduler](#input\_scheduler) | Configuration for resources used by Airflow schedulers. | <pre>object({<br>    cpu        = string<br>    memory_gb  = number<br>    storage_gb = number<br>    count      = number<br>  })</pre> | <pre>{<br>  "count": 2,<br>  "cpu": 2,<br>  "memory_gb": 7.5,<br>  "storage_gb": 5<br>}</pre> | no |
| <a name="input_service_ip_allocation_range_name"></a> [service\_ip\_allocation\_range\_name](#input\_service\_ip\_allocation\_range\_name) | The name of the services' secondary range used to allocate IP addresses to the cluster. | `string` | `null` | no |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | The subnetwork to host the composer cluster. | `string` | n/a | yes |
| <a name="input_subnetwork_region"></a> [subnetwork\_region](#input\_subnetwork\_region) | The subnetwork region of the shared VPC's host (for shared vpc support) | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to all nodes. Tags are used to identify valid sources or targets for network firewalls. | `set(string)` | `[]` | no |
| <a name="input_use_private_environment"></a> [use\_private\_environment](#input\_use\_private\_environment) | Enable private environment. | `bool` | `true` | no |
| <a name="input_web_server"></a> [web\_server](#input\_web\_server) | Configuration for resources used by Airflow web server. | <pre>object({<br>    cpu        = string<br>    memory_gb  = number<br>    storage_gb = number<br>  })</pre> | <pre>{<br>  "cpu": 2,<br>  "memory_gb": 7.5,<br>  "storage_gb": 5<br>}</pre> | no |
| <a name="input_web_server_allowed_ip_ranges"></a> [web\_server\_allowed\_ip\_ranges](#input\_web\_server\_allowed\_ip\_ranges) | The network-level access control policy for the Airflow web server. If unspecified, no network-level access restrictions will be applied. | <pre>list(object({<br>    value       = string,<br>    description = string<br>  }))</pre> | `null` | no |
| <a name="input_worker"></a> [worker](#input\_worker) | Configuration for resources used by Airflow workers. | <pre>object({<br>    cpu        = string<br>    memory_gb  = number<br>    storage_gb = number<br>    min_count  = number<br>    max_count  = number<br>  })</pre> | <pre>{<br>  "cpu": 2,<br>  "max_count": 6,<br>  "memory_gb": 7.5,<br>  "min_count": 2,<br>  "storage_gb": 5<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_airflow_uri"></a> [airflow\_uri](#output\_airflow\_uri) | URI of the Apache Airflow Web UI hosted within the Cloud Composer Environment. |
| <a name="output_composer_env_id"></a> [composer\_env\_id](#output\_composer\_env\_id) | ID of Cloud Composer Environment. |
| <a name="output_composer_env_name"></a> [composer\_env\_name](#output\_composer\_env\_name) | Name of the Cloud Composer Environment. |
| <a name="output_gcs_bucket"></a> [gcs\_bucket](#output\_gcs\_bucket) | Google Cloud Storage bucket which hosts DAGs for the Cloud Composer Environment. |
| <a name="output_gke_cluster"></a> [gke\_cluster](#output\_gke\_cluster) | Google Kubernetes Engine cluster used to run the Cloud Composer Environment. |
