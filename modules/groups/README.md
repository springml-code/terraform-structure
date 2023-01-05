<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.67, < 5.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 3.67, < 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_group"></a> [group](#module\_group) | terraform-google-modules/group/google | ~> 0.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_customer_id"></a> [customer\_id](#input\_customer\_id) | Customer ID of the organization to create the group in. One of domain or customer\_id must be specified | `string` | `""` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the group | `string` | `""` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Display name of the group | `string` | `""` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Domain of the organization to create the group in. One of domain or customer\_id must be specified | `string` | `""` | no |
| <a name="input_id"></a> [id](#input\_id) | ID of the group. For Google-managed entities, the ID must be the email address the group | `any` | n/a | yes |
| <a name="input_managers"></a> [managers](#input\_managers) | Managers of the group. Each entry is the ID of an entity. For Google-managed entities, the ID must be the email address of an existing group, user or service account | `list` | `[]` | no |
| <a name="input_members"></a> [members](#input\_members) | Members of the group. Each entry is the ID of an entity. For Google-managed entities, the ID must be the email address of an existing group, user or service account | `list` | `[]` | no |
| <a name="input_owners"></a> [owners](#input\_owners) | Owners of the group. Each entry is the ID of an entity. For Google-managed entities, the ID must be the email address of an existing group, user or service account | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of the group. For Google-managed entities, the ID is the email address the group |
| <a name="output_resource_name"></a> [resource\_name](#output\_resource\_name) | Resource name of the group in the format: groups/{group\_id}, where group\_id is the unique ID assigned to the group. |
<!-- END_TF_DOCS -->