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
| [google_logging_metric.user_metric](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_metric) | resource |
| [google_monitoring_alert_policy.alert_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_alert_policy) | resource |
| [google_monitoring_notification_channel.notif_channel](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_notification_channel) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_policy_config"></a> [alert\_policy\_config](#input\_alert\_policy\_config) | Alert policy configuration | <pre>map(object({<br>    display_name = string<br>    combiner = string<br>    condition_name = string<br>    condition_duration = string<br>    labels = map(string)<br>    alerting_message = string<br>  }))</pre> | n/a | yes |
| <a name="input_log_metric_config"></a> [log\_metric\_config](#input\_log\_metric\_config) | User logging metric configuration | <pre>map(object({<br>    filter = string<br>  }))</pre> | n/a | yes |
| <a name="input_notif_channel_force_delete"></a> [notif\_channel\_force\_delete](#input\_notif\_channel\_force\_delete) | Force delete flag for the Notification Channel | `bool` | n/a | yes |
| <a name="input_notif_channel_labels"></a> [notif\_channel\_labels](#input\_notif\_channel\_labels) | Labels for the Notification Channel | `map(string)` | n/a | yes |
| <a name="input_notif_channel_name"></a> [notif\_channel\_name](#input\_notif\_channel\_name) | Display name for the Notification Channel | `string` | n/a | yes |
| <a name="input_notif_channel_type"></a> [notif\_channel\_type](#input\_notif\_channel\_type) | The type of the Notification Channel. Acceptable values are: campfire, email, hipchat, pagerduty, pubsub, slack, sms, webhook\_basicauth, webhook\_tokenauth | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP project ID where all the resources will be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_notif_verification_status"></a> [notif\_verification\_status](#output\_notif\_verification\_status) | Verification status of the Notification channel |
