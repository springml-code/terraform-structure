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
| <a name="module_org-policy"></a> [org-policy](#module\_org-policy) | terraform-google-modules/org-policy/google | ~> 3.0.2 |

## Resources

No resources.

## Variables

To control module's behavior, change variables' values regarding the following:

- **constraint**: set this variable with the constraint value in the form constraints/{constraint identifier}. For example, constraints/serviceuser.services
- **policy_type**: Specify either boolean for boolean policies or list for list policies. (default list)
- Policy Root: set **one** of the following values to determine where the policy is applied:
  - organization_id (As per requirement Org policies cannot be set at Organization level)
  - project_id (As per requirement Org policies cannot be set at Project level)
  - **folder_id** (As per requirement Org policies can only be set at Folder level)
- **exclude_folders**: a list of folder IDs to be excluded from this policy. These folders must be lower in the hierarchy than the policy root.
- **exclude_projects**: a list of project IDs to be excluded from this policy. They must be lower in the hierarchy than the policy root.
- Boolean policies (with policy_type: "boolean") can set the following variables:
  - **enforce**: if true or null then the policy is enforced at the root; if false then policy is not enforced at the root. (default null)
- List policies (with policy_type: "list") can set **one of** the following variables. Only **one** may be set.
  - **enforce**: if true or null then policy will deny all; if false then policy will allow all (default null)
  - **allow**: list of values to include in the policy with ALLOW behavior. *Set enforce to null to use it*.
  - **deny**: list of values to include in the policy with DENY behavior. *Set enforce to null to use it*.
- List policies with allow **or** deny values require the length to be set (a workaround for this terraform issue)
  - **allow_list_length**
  - **deny_list_length**
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow"></a> [allow](#input\_allow) | (Only for list constraints) List of values which should be allowed | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_allow_list_length"></a> [allow\_list\_length](#input\_allow\_list\_length) | The number of elements in the allow list | `number` | `0` | no |
| <a name="input_constraint"></a> [constraint](#input\_constraint) | The constraint to be applied | `string` | n/a | yes |
| <a name="input_deny"></a> [deny](#input\_deny) | (Only for list constraints) List of values which should be denied | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_deny_list_length"></a> [deny\_list\_length](#input\_deny\_list\_length) | The number of elements in the deny list | `number` | `0` | no |
| <a name="input_enforce"></a> [enforce](#input\_enforce) | If boolean constraint, whether the policy is enforced at the root; if list constraint, whether to deny all (true) or allow all | `bool` | `null` | no |
| <a name="input_exclude_folders"></a> [exclude\_folders](#input\_exclude\_folders) | Set of folders to exclude from the policy | `set(string)` | `[]` | no |
| <a name="input_exclude_projects"></a> [exclude\_projects](#input\_exclude\_projects) | Set of projects to exclude from the policy | `set(string)` | `[]` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The folder id for putting the policy | `string` | `null` | no |
| <a name="input_policy_for"></a> [policy\_for](#input\_policy\_for) | Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`. | `string` | n/a | yes |
| <a name="input_policy_type"></a> [policy\_type](#input\_policy\_type) | The constraint type to work with (either 'boolean' or 'list') | `string` | `"list"` | no |

## Outputs

No outputs.