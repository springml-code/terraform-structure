<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.53, < 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_custom_roles"></a> [custom\_roles](#module\_custom\_roles) | terraform-google-modules/iam/google//modules/custom_role_iam | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_roles"></a> [base\_roles](#input\_base\_roles) | List of base predefined roles to use to compose custom role. | `list(string)` | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of Custom role. | `string` | `""` | no |
| <a name="input_excluded_permissions"></a> [excluded\_permissions](#input\_excluded\_permissions) | List of permissions to exclude from custom role. | `list(string)` | `[]` | no |
| <a name="input_members"></a> [members](#input\_members) | List of members to be added to custom role. | `list(string)` | n/a | yes |
| <a name="input_permissions"></a> [permissions](#input\_permissions) | IAM permissions assigned to Custom Role. | `list(string)` | n/a | yes |
| <a name="input_role_id"></a> [role\_id](#input\_role\_id) | ID of the Custom Role. | `string` | n/a | yes |
| <a name="input_stage"></a> [stage](#input\_stage) | The current launch stage of the role. Defaults to GA. | `string` | `"GA"` | no |
| <a name="input_target_id"></a> [target\_id](#input\_target\_id) | Variable for project or organization ID. | `string` | n/a | yes |
| <a name="input_target_level"></a> [target\_level](#input\_target\_level) | String variable to denote if custom role being created is at project or organization level. | `string` | `"project"` | no |
| <a name="input_title"></a> [title](#input\_title) | Human-readable title of the Custom Role, defaults to role\_id. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_role_id"></a> [custom\_role\_id](#output\_custom\_role\_id) | ID of the custom role created. |
<!-- END_TF_DOCS -->