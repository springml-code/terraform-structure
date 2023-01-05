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
| <a name="module_storage_bucket_iam_bindings"></a> [storage\_bucket\_iam\_bindings](#module\_storage\_bucket\_iam\_bindings) | terraform-google-modules/iam/google//modules/storage_buckets_iam | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bindings"></a> [bindings](#input\_bindings) | Map of role (key) and list of members (value) to add the IAM policies/bindings | `map(list(string))` | `{}` | no |
| <a name="input_conditional_bindings"></a> [conditional\_bindings](#input\_conditional\_bindings) | List of maps of role and respective conditions, and the members to add the IAM policies/bindings | <pre>list(object({<br>    role        = string<br>    title       = string<br>    description = string<br>    expression  = string<br>    members     = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | Mode for adding the IAM policies/bindings, additive and authoritative | `string` | `"additive"` | no |
| <a name="input_storage_buckets"></a> [storage\_buckets](#input\_storage\_buckets) | Storage Buckets list to add the IAM policies/bindings | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_members"></a> [members](#output\_members) | Members which were bound to the Storage Bucket. |
<!-- END_TF_DOCS -->