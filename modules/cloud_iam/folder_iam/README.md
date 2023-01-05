<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.53, < 5.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_folder_conditional_bindings"></a> [folder\_conditional\_bindings](#input\_folder\_conditional\_bindings) | List of maps of role and respective conditions, and the members to add the IAM policies/bindings | <pre>list(object({<br>    role        = string<br>    title       = string<br>    description = string<br>    expression  = string<br>    members     = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_folder_iam_bindings"></a> [folder\_iam\_bindings](#input\_folder\_iam\_bindings) | Map of role (key) and list of members (value) to add the IAM policies/bindings | `map(list(string))` | `{}` | no |
| <a name="input_folder_iam_mode"></a> [folder\_iam\_mode](#input\_folder\_iam\_mode) | Mode for adding the IAM policies/bindings, additive and authoritative | `string` | `"additive"` | no |
| <a name="input_folder_names"></a> [folder\_names](#input\_folder\_names) | Folders list to add the IAM policies/bindings | `list(string)` | `[]` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->