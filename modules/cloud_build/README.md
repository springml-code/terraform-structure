<!-- BEGIN_TF_DOCS -->
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

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_cloudbuild_trigger.pull_request_trigger](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_trigger) | resource |
| [google_cloudbuild_trigger.push_trigger](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_trigger) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_approval_required"></a> [approval\_required](#input\_approval\_required) | Whether or not approval is needed | `bool` | `false` | no |
| <a name="input_branch_name"></a> [branch\_name](#input\_branch\_name) | Regex of branches to match | `string` | n/a | yes |
| <a name="input_create_pull_trigger"></a> [create\_pull\_trigger](#input\_create\_pull\_trigger) | Create a pull request trigger | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Human-readable description of the trigger | `string` | `""` | no |
| <a name="input_disabled"></a> [disabled](#input\_disabled) | Whether the trigger is disabled or not | `bool` | `false` | no |
| <a name="input_filename"></a> [filename](#input\_filename) | Path, from the source root, to a file whose contents is used for the template | `string` | n/a | yes |
| <a name="input_github_owner"></a> [github\_owner](#input\_github\_owner) | Owner of the repository | `string` | n/a | yes |
| <a name="input_github_repo_name"></a> [github\_repo\_name](#input\_github\_repo\_name) | Name of the repository | `string` | n/a | yes |
| <a name="input_include_build_logs"></a> [include\_build\_logs](#input\_include\_build\_logs) | Build logs will be sent back to GitHub as part of the checkrun result | `string` | `"INCLUDE_BUILD_LOGS_WITH_STATUS"` | no |
| <a name="input_included_files"></a> [included\_files](#input\_included\_files) | Changed files will trigger build | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID | `string` | n/a | yes |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | The service account used for all user-controlled operations | `string` | `null` | no |
| <a name="input_substitutions"></a> [substitutions](#input\_substitutions) | Substitutions data for Build resource | `map(string)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for annotation of a BuildTrigger | `list(string)` | `null` | no |
| <a name="input_trigger_name"></a> [trigger\_name](#input\_trigger\_name) | Name of the trigger | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
