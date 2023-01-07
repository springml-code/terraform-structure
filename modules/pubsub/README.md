<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.32, < 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_pubsub"></a> [pubsub](#module\_pubsub) | terraform-google-modules/pubsub/google | ~> 5.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bigquery_subscriptions"></a> [bigquery\_subscriptions](#input\_bigquery\_subscriptions) | The list of the bigquery push subscriptions. | `list(map(string))` | `[]` | no |
| <a name="input_create_subscriptions"></a> [create\_subscriptions](#input\_create\_subscriptions) | Specify true if you want to create subscriptions. | `bool` | `true` | no |
| <a name="input_create_topic"></a> [create\_topic](#input\_create\_topic) | Specify true if you want to create a topic. | `bool` | `true` | no |
| <a name="input_grant_token_creator"></a> [grant\_token\_creator](#input\_grant\_token\_creator) | Specify true if you want to add token creator role to the default Pub/Sub SA. | `bool` | `true` | no |
| <a name="input_message_storage_policy"></a> [message\_storage\_policy](#input\_message\_storage\_policy) | A map of storage policies. Default - inherit from organization's Resource Location Restriction policy. | `map(any)` | `{}` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID to manage the Pub/Sub resources. | `string` | n/a | yes |
| <a name="input_pull_subscriptions"></a> [pull\_subscriptions](#input\_pull\_subscriptions) | The list of the pull subscriptions. | `list(map(string))` | `[]` | no |
| <a name="input_push_subscriptions"></a> [push\_subscriptions](#input\_push\_subscriptions) | The list of the push subscriptions. | `list(map(string))` | `[]` | no |
| <a name="input_schema"></a> [schema](#input\_schema) | Schema for the topic. | <pre>object({<br>    name       = string<br>    type       = string<br>    definition = string<br>    encoding   = string<br>  })</pre> | `null` | no |
| <a name="input_subscription_labels"></a> [subscription\_labels](#input\_subscription\_labels) | A map of labels to assign to every Pub/Sub subscription. | `map(string)` | `{}` | no |
| <a name="input_topic"></a> [topic](#input\_topic) | The Pub/Sub topic name. | `string` | n/a | yes |
| <a name="input_topic_kms_key_name"></a> [topic\_kms\_key\_name](#input\_topic\_kms\_key\_name) | The resource name of the Cloud KMS CryptoKey to be used to protect access to messages published on this topic. | `string` | `null` | no |
| <a name="input_topic_labels"></a> [topic\_labels](#input\_topic\_labels) | A map of labels to assign to the Pub/Sub topic. | `map(string)` | `{}` | no |
| <a name="input_topic_message_retention_duration"></a> [topic\_message\_retention\_duration](#input\_topic\_message\_retention\_duration) | The minimum duration in seconds to retain a message after it is published to the topic. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of pubsub topic |
| <a name="output_subscription_names"></a> [subscription\_names](#output\_subscription\_names) | The name list of Pub/Sub subscriptions |
| <a name="output_subscription_paths"></a> [subscription\_paths](#output\_subscription\_paths) | The path list of Pub/Sub subscriptions |
| <a name="output_topic"></a> [topic](#output\_topic) | The name of the Pub/Sub topic |
| <a name="output_topic_labels"></a> [topic\_labels](#output\_topic\_labels) | Labels assigned to the Pub/Sub topic |
| <a name="output_uri"></a> [uri](#output\_uri) | The URI of the Pub/Sub topic |
<!-- END_TF_DOCS -->