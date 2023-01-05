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
| <a name="module_project-iam-bindings"></a> [project-iam-bindings](#module\_project-iam-bindings) | terraform-google-modules/iam/google//modules/projects_iam | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_conditional_bindings"></a> [project\_conditional\_bindings](#input\_project\_conditional\_bindings) | List of maps of role and respective conditions, and the members to add the IAM policies/bindings | <pre>list(object({<br>    role        = string<br>    title       = string<br>    description = string<br>    expression  = string<br>    members     = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_project_iam_bindings"></a> [project\_iam\_bindings](#input\_project\_iam\_bindings) | Map of role (key) and list of members (value) to add the IAM policies/bindings | `map(list(string))` | `{}` | no |
| <a name="input_project_iam_mode"></a> [project\_iam\_mode](#input\_project\_iam\_mode) | Mode for adding the IAM policies/bindings, additive and authoritative | `string` | `"additive"` | no |
| <a name="input_project_names"></a> [project\_names](#input\_project\_names) | Projects list to add the IAM policies/bindings | `list(string)` | `[]` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->