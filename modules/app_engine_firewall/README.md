<!-- BEGIN_TF_DOCS -->
## Description

This module supports creation of App Engine firewall rules on a given project.


## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |


## Resources

| Name | Type |
|------|------|
| [google_app_engine_firewall_rule.rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_firewall_rule) | resource |


## Modules

Please see [appengine-firewall](../../examples/appengine-firewall/) for usage example

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall_rule_config"></a> [firewall\_rule\_config](#input\_firewall\_rule\_config) | the configuration of firewall rule in a map to be added to app engine |<code>object({<br>source_range = string<br>priority = number<br>action = string<br>description = string<br>})</code> | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID in which the service will be enabled | `string` | n/a | yes |

Note: The input for firewall rule is taken as an object instead of a seperate variable for each value as this provides more flexibility. For example, we can club multiple objects together in a map to create multiple firewall rules by passing only one variable in the parent module. Please see the above linked example.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall-rule-id"></a> [firewall-rule-id](#output\_firewall-rule-id) | the ID of the firewall rule created |
<!-- END_TF_DOCS -->