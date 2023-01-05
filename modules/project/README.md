<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_project_factory"></a> [project\_factory](#module\_project\_factory) | terraform-google-modules/project-factory/google | ~> 10.1 |
| <a name="module_state_bucket"></a> [state\_bucket](#module\_state\_bucket) | ../cloud_storage | n/a |
| <a name="module_tf_sa_project_iam"></a> [tf\_sa\_project\_iam](#module\_tf\_sa\_project\_iam) | ../cloud_iam/project_iam | n/a |
| <a name="module_tf_state_bucket_iam_bindings"></a> [tf\_state\_bucket\_iam\_bindings](#module\_tf\_state\_bucket\_iam\_bindings) | ../cloud_iam/storage_iam | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | APIs to activate | `list(string)` | n/a | yes |
| <a name="input_attach_vpc_service_control"></a> [attach\_vpc\_service\_control](#input\_attach\_vpc\_service\_control) | Whether to attach vpc sc | `string` | `false` | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | Billing Account ID | `string` | n/a | yes |
| <a name="input_default_service_account"></a> [default\_service\_account](#input\_default\_service\_account) | Whether to keep, disable or delete default project service account | `string` | `"disable"` | no |
| <a name="input_enable_shared_vpc_service_project"></a> [enable\_shared\_vpc\_service\_project](#input\_enable\_shared\_vpc\_service\_project) | Whether to enable shared vpc service project or not | `bool` | `false` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | Folder ID | `string` | n/a | yes |
| <a name="input_grant_network_role"></a> [grant\_network\_role](#input\_grant\_network\_role) | Whether to grant the project sa network role or not | `bool` | `false` | no |
| <a name="input_is_state_bucket_created"></a> [is\_state\_bucket\_created](#input\_is\_state\_bucket\_created) | To check if state bucket is created | `bool` | `true` | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | Organization ID | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name | `string` | n/a | yes |
| <a name="input_project_sa_name"></a> [project\_sa\_name](#input\_project\_sa\_name) | Name of project default service account | `string` | `""` | no |
| <a name="input_random_project_id"></a> [random\_project\_id](#input\_random\_project\_id) | Random id for suffix | `bool` | `false` | no |
| <a name="input_sa_bindings"></a> [sa\_bindings](#input\_sa\_bindings) | Map of role (key) and list of members (value) to add the IAM policies/bindings to service account | `map(list(string))` | `null` | no |
| <a name="input_sa_role"></a> [sa\_role](#input\_sa\_role) | what role to give to project default service account | `string` | `""` | no |
| <a name="input_spoke_subnet"></a> [spoke\_subnet](#input\_spoke\_subnet) | List of subnets fully qualified subnet IDs (ie. projects/$project\_id/regions/$region/subnetworks/$subnet\_id) | `list(string)` | `[]` | no |
| <a name="input_storage_bindings"></a> [storage\_bindings](#input\_storage\_bindings) | Map of role (key) and list of members (value) to add the IAM policies/bindings to storage buckets | `map(list(string))` | `{}` | no |
| <a name="input_svpc_host_project_id"></a> [svpc\_host\_project\_id](#input\_svpc\_host\_project\_id) | The ID of the network host project which hosts the shared VPC | `string` | `""` | no |
| <a name="input_tf_sa_project_iam_bindings"></a> [tf\_sa\_project\_iam\_bindings](#input\_tf\_sa\_project\_iam\_bindings) | Map of role (key) and list of members (value) to add the IAM policies/bindings | `map(list(string))` | `{}` | no |
| <a name="input_tf_state_bucket_name"></a> [tf\_state\_bucket\_name](#input\_tf\_state\_bucket\_name) | Bucket name for the exisiting tf state bucket for the env | `string` | `null` | no |
| <a name="input_vpc_service_control_parameter_name"></a> [vpc\_service\_control\_parameter\_name](#input\_vpc\_service\_control\_parameter\_name) | VPC SC perimeter name | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | name of the project state bucket |
| <a name="output_bucket_url"></a> [bucket\_url](#output\_bucket\_url) | Self link of the project bucket |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | Project Id of the created project |
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | Project default service account email |
<!-- END_TF_DOCS -->
