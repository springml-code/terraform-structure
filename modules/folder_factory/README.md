<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.53, < 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.53, < 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_non_prod_folder_iam_member"></a> [non\_prod\_folder\_iam\_member](#module\_non\_prod\_folder\_iam\_member) | ../cloud_iam | n/a |
| <a name="module_prod_folder_iam_member"></a> [prod\_folder\_iam\_member](#module\_prod\_folder\_iam\_member) | ../cloud_iam | n/a |

## Resources

| Name | Type |
|------|------|
| [google_folder.spoke_project_env_folders](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_folder.spoke_project_root_folder](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env_folders"></a> [env\_folders](#input\_env\_folders) | List of sub folders under the parent spoke-project folder | `map(string)` | n/a | yes |
| <a name="input_non_prod_folder_iam_bindings"></a> [non\_prod\_folder\_iam\_bindings](#input\_non\_prod\_folder\_iam\_bindings) | Map of role (key) and list of members (value) to add the IAM policies/bindings to non prod folder | `map(list(string))` | n/a | yes |
| <a name="input_prod_folder_iam_bindings"></a> [prod\_folder\_iam\_bindings](#input\_prod\_folder\_iam\_bindings) | Map of role (key) and list of members (value) to add the IAM policies/bindings to the prod folder | `map(list(string))` | n/a | yes |
| <a name="input_spoke_folder"></a> [spoke\_folder](#input\_spoke\_folder) | Name of the parent folder of the spoke project | `string` | n/a | yes |
| <a name="input_tn_data_folder_id"></a> [tn\_data\_folder\_id](#input\_tn\_data\_folder\_id) | TN-DATA Folder Id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_env_folders"></a> [env\_folders](#output\_env\_folders) | Map (env-folder : env-folder-id) of Sub-folders created under the parent folder of spoke project |
| <a name="output_spoke_folder"></a> [spoke\_folder](#output\_spoke\_folder) | Parent folder created for the spoke project |
<!-- END_TF_DOCS -->