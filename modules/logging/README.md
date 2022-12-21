
# Log Export module
This module creates folder level and billing account log sinks. It supports GCS, Logging Buckets, and Pub/Sub as a destination. Each destination type has a `for_each` loop and its attributes is defined as map objects. It's not mandatory to create all destination types.

Log Routing: https://cloud.google.com/logging/docs/routing/overview

Logging Buckets: https://cloud.google.com/logging/docs/buckets

## The following describes the opinion of this module.
### General
- Log sinks are applied at the folder level. (parent_resource_type = "folder")
- Each log sink has a unique SA for writer identity (unique_writer_identity = true)

### GCS
- The GCS bucket storage class is being set to Coldline.
- Objects in the GCS bucket have a locked retention policy.
- Objects in the bucket will delete when the retention policy has been met.
- Terraform will not destroy bucket will if it contains objects.

###Pub/Sub
- Pub/Sub topics is created with a pull configuration.
- A pull subscription is created along with a service account that is granted roles/pubsub.subscriber and roles/pubsub.viewer to the topic.
- If need be, the code can be altered to support push configuration, subscription labels and topic labels.

## Options include

### General
- exclusions - A list of sink exclusion filters
- filter - The filter to apply when exporting logs. Only log entries that match the filter are exported. Use '' to export all logs.
- folder_id - The folder ID of the GCP resource in which you create the log sink
- include_children - You may opt to include child folders in the log sinks
- location - the region(s) to house the data
- log_sink_name - Define the log sink name
- logging_project - The project ID where the log sink will exist

### GCS Bucket
- bucket_name - The name of the bucket to create.
- kms_key_name - ID of a Cloud KMS key that will be used to encrypt objects inserted into this bucket. Automatic Google Cloud Storage service account for the bucket's project requires access to this encryption key.
- location - https://cloud.google.com/storage/docs/locations#available-locations
- retention_period_days - the number of days to archive an object

### Logging Bucket
- location - https://cloud.google.com/storage/docs/locations#available-locations
- retention_days - Logs will be retained by default for this amount of time, after which they will automatically be deleted. The minimum retention period is 1 day. If this value is set to zero at bucket creation time, the default time of 30 days will be used.

### Pub/Sub
- kms_key_name - ID of a Cloud KMS CryptoKey to be used to protect access to messages published on this topic. Your project's PubSub service account requires access to this encryption key.
- subscriber_id - Define the service account ID to give the pubsub pull subscriber service account
- topic_name - The name of the pubsub topic to be created and used for log entries matching the filter.
- pull_subscriptions - The name of the subscriptions to create and its configuration. See ./examples/terraform.tfvars for available attributes.

### Billing Logging Bucket
- bucket_name - The name of an existing bucket or one created by this module that defined in var.logging_bucket
- billing_account - The billing accounts ID
- location - The location of the where var.gcs[each.key].bucket_name resides

### Billing Pubsub
- topic_name - The name of an existing topic or one created by this module that defined in var.pubsub
- billing_account - The billing accounts ID

### Billing Cloud Storage Bucket
- bucket_name - The name of an existing bucket or one created by this module that defined in var.gcs
- billing_account - The billing accounts ID

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.53, < 5.0 |

## Example
`main.tf`
```hcl
module "logging" {
  source = "../"

  billing_gcs            = var.billing_gcs
  billing_logging_bucket = var.billing_logging_bucket
  billing_pubsub         = var.billing_pubsub
  gcs                    = var.gcs
  logging_bucket         = var.logging_bucket
  pubsub                 = var.pubsub
}
```
`terraform.tfavrs`
```hcl
gcs = {
  all_logs = {
    bucket_name           = "gold-atlas-330414-logs"
    exclusions            = []
    filter                = ""
    folder_id             = 368837092707
    include_children      = false
    kms_key_name          = "" // "projects/gold-atlas-330414/locations/us/keyRings/test-JhIn/cryptoKeys/test-JhIn"
    location              = "US"
    log_sink_name         = "gcs_sandbox_logs"
    logging_project       = "gold-atlas-330414"
    retention_period_days = 1
  }
  all_logs2 = {
    bucket_name           = "gold-atlas-330414-logs2"
    exclusions            = []
    filter                = ""
    folder_id             = 368837092707
    include_children      = false
    kms_key_name          = ""
    location              = "US"
    log_sink_name         = "gcs_sandbox_logs2"
    logging_project       = "gold-atlas-330414"
    retention_period_days = 1
  }
}

logging_bucket = {
  all_logs = {
    bucket_name      = "gold-atlas-330414-logging-folder3"
    exclusions       = []
    filter           = ""
    folder_id        = 368837092707
    include_children = false
    location         = "global"
    log_sink_name    = "gcs_sandbox_logging_bucket"
    logging_project  = "gold-atlas-330414"
    retention_days   = 1
  }
}

pubsub = {
  qradar = {
    exclusions       = []
    filter           = "(protoPayload.@type=type.googleapis.com/google.cloud.audit.AuditLog)"
    folder_id        = 368837092707
    include_children = false
    kms_key_name     = "" //"projects/gold-atlas-330414/locations/us/keyRings/test-JhIn/cryptoKeys/test-JhIn"
    log_sink_name    = "sink-1"
    logging_project  = "gold-atlas-330414"
    topic_name       = "topic-1"
    pull_subscriptions = [
      {
        name                         = "qradar-sub-1"
        topic                        = "topic-1"                                            // must match value of topic_name
        ack_deadline_seconds         = 20                                                   // optional
        dead_letter_topic            = "projects/my-pubsub-project/topics/example-dl-topic" // optional
        max_delivery_attempts        = 5                                                    // optional
        maximum_backoff              = "600s"                                               // optional
        minimum_backoff              = "300s"                                               // optional
        filter                       = "attributes.domain = \"com\""                        // optional
        enable_message_ordering      = false                                                // optional
        service_account              = "service2@project2.iam.gserviceaccount.com"          // optional
        enable_exactly_once_delivery = true                                                 // optional
      }
    ]
  },
  splunk = {
    exclusions       = []
    filter           = "(protoPayload.@type=type.googleapis.com/google.cloud.audit.AuditLog)"
    folder_id        = 368837092707
    include_children = false
    kms_key_name     = "" //"projects/gold-atlas-330414/locations/us/keyRings/test-JhIn/cryptoKeys/test-JhIn"
    log_sink_name    = "sink-2"
    logging_project  = "gold-atlas-330414"
    topic_name       = "topic-2"
    pull_subscriptions = [
      {
        name  = "splunk-sub-1"
        topic = "topic-2" // must match value of topic_name
      }
    ]
  }
}

billing_gcs = {
  1 = {
    bucket_name     = "gold-atlas-330414-logs"
    filter          = ""
    billing_account = "012881-1254C8-BD8910"
    log_sink_name   = "billing-gcs"
    logging_project = "gold-atlas-330414"
  }
}

billing_pubsub = {
  1 = {
    topic_name      = "topic-1"
    filter          = ""
    billing_account = "012881-1254C8-BD8910"
    log_sink_name   = "billing-pubsub-1"
    logging_project = "gold-atlas-330414"
  }
  2 = {
    topic_name      = "topic-2"
    filter          = ""
    billing_account = "012881-1254C8-BD8910"
    log_sink_name   = "billing-pubsub-2"
    logging_project = "gold-atlas-330414"
  }
}

billing_logging_bucket = {
  1 = {
    bucket_name     = "gold-atlas-330414-logging-folder3"
    filter          = ""
    billing_account = "012881-1254C8-BD8910"
    log_sink_name   = "billing-logging-bucket"
    location        = "global"
    logging_project = "gold-atlas-330414"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_gcs"></a> [billing\_gcs](#input\_billing\_gcs) | Billing configuration. You must have the Logs Configuration Writer IAM role (roles/logging.configWriter) granted on the billing account to the credentials used with Terraform. IAM roles granted on a billing account are separate from the typical IAM roles granted on a project. | <pre>map(object({<br>    bucket_name     = string // must match a bucket name defined in var.gcs                         // A list of sink exclusion filters.<br>    filter          = string // The filter to apply when exporting logs. Only log entries that match the filter are exported. '' which exports all logs.<br>    billing_account = string // The Billing Account ID of the GCP resource in which you create the log sink.<br>    log_sink_name   = string // The name of the log sink to be created.<br>    logging_project = string // The ID of the project in which the dataset will be created.<br>  }))</pre> | `{}` | no |
| <a name="input_billing_logging_bucket"></a> [billing\_logging\_bucket](#input\_billing\_logging\_bucket) | Billing configuration. You must have the Logs Configuration Writer IAM role (roles/logging.configWriter) granted on the billing account to the credentials used with Terraform. IAM roles granted on a billing account are separate from the typical IAM roles granted on a project. | <pre>map(object({<br>    bucket_name     = string // must match a bucket name defined in var.gcs                         // A list of sink exclusion filters.<br>    filter          = string // The filter to apply when exporting logs. Only log entries that match the filter are exported. '' which exports all logs.<br>    billing_account = string // The Billing Account ID of the GCP resource in which you create the log sink.<br>    log_sink_name   = string // The name of the log sink to be created.<br>    logging_project = string // The ID of the project in which the dataset will be created.<br>    location        = string<br>  }))</pre> | `{}` | no |
| <a name="input_billing_pubsub"></a> [billing\_pubsub](#input\_billing\_pubsub) | Billing configuration. You must have the Logs Configuration Writer IAM role (roles/logging.configWriter) granted on the billing account to the credentials used with Terraform. IAM roles granted on a billing account are separate from the typical IAM roles granted on a project. | <pre>map(object({<br>    topic_name      = string // must match a bucket name defined in var.gcs                         // A list of sink exclusion filters.<br>    filter          = string // The filter to apply when exporting logs. Only log entries that match the filter are exported. '' which exports all logs.<br>    billing_account = string // The Billing Account ID of the GCP resource in which you create the log sink.<br>    log_sink_name   = string // The name of the log sink to be created.<br>    logging_project = string // The ID of the project in which the dataset will be created.<br>  }))</pre> | `{}` | no |
| <a name="input_gcs"></a> [gcs](#input\_gcs) | Cloud Storage configuration | <pre>map(object({<br>    exclusions = list(object({<br>      name        = string,<br>      description = string,<br>      filter      = string,<br>      disabled    = bool<br>    })) // A list of sink exclusion filters.<br>    bucket_name           = string<br>    filter                = string // The filter to apply when exporting logs. Only log entries that match the filter are exported. '' which exports all logs.<br>    folder_id             = number // The folder ID of the GCP resource in which you create the log sink.<br>    kms_key_name          = string // 	ID of a Cloud KMS key that will be used to encrypt objects inserted into this bucket. Automatic Google Cloud Storage service account for the bucket's project requires access to this encryption key.<br>    include_children      = bool   // Only valid if 'organization' or 'folder' is chosen as var.parent_resource.type. Determines whether or not to include children organizations/folders in the sink export. If true, logs associated with child projects are also exported; otherwise only logs relating to the provided organization/folder are included.<br>    location              = string<br>    log_sink_name         = string // The name of the log sink to be created.<br>    logging_project       = string // The ID of the project in which the bucket will be created.<br>    retention_period_days = number<br>  }))</pre> | `{}` | no |
| <a name="input_logging_bucket"></a> [logging\_bucket](#input\_logging\_bucket) | Logging Bucket configuration | <pre>map(object({<br>    bucket_name = string, // The name of the logging bucket to create.<br>    exclusions = list(object({<br>      name        = string,<br>      description = string,<br>      filter      = string,<br>      disabled    = bool<br>    }))                       // A list of sink exclusion filters.<br>    filter           = string // The filter to apply when exporting logs. Only log entries that match the filter are exported. '' which exports all logs.<br>    folder_id        = number // The folder ID of the GCP resource in which you create the log sink.<br>    include_children = bool   // Only valid if 'organization' or 'folder' is chosen as var.parent_resource.type. Determines whether or not to include children organizations/folders in the sink export. If true, logs associated with child projects are also exported; otherwise only logs relating to the provided organization/folder are included.<br>    location         = string // The geographic location where the dataset should reside. https://cloud.google.com/bigquery/docs/locations<br>    log_sink_name    = string // The name of the log sink to be created.<br>    logging_project  = string // The ID of the project in which the dataset will be created.<br>    retention_days   = number // Logs will be retained by default for this amount of time, after which they will automatically be deleted. The minimum retention period is 1 day. If this value is set to zero at bucket creation time, the default time of 30 days will be used.<br>  }))</pre> | `{}` | no |
| <a name="input_pubsub"></a> [pubsub](#input\_pubsub) | pubsub configuration | <pre>map(object({<br>    exclusions = list(object({<br>      name        = string,<br>      description = string,<br>      filter      = string,<br>      disabled    = bool<br>    }))                                    // A list of sink exclusion filters.<br>    filter             = string            // The filter to apply when exporting logs. Only log entries that match the filter are exported. '' which exports all logs.<br>    folder_id          = number            // The folder ID of the GCP resource in which you create the log sink.<br>    include_children   = bool              // Only valid if 'organization' or 'folder' is chosen as var.parent_resource.type. Determines whether or not to include children organizations/folders in the sink export. If true, logs associated with child projects are also exported; otherwise only logs relating to the provided organization/folder are included.<br>    kms_key_name       = string            // ID of a Cloud KMS CryptoKey to be used to protect access to messages published on this topic. Your project's PubSub service account requires access to this encryption key.<br>    log_sink_name      = string            // The name of the log sink to be created.<br>    logging_project    = string            // The ID of the project in which the pubsub topic will be created.<br>    topic_name         = string            // The name of the pubsub topic to be created and used for log entries matching the filter.<br>    pull_subscriptions = list(map(string)) // The names of subscriptions to create<br>  }))</pre> | `{}` | no |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcs_bucket"></a> [gcs\_bucket](#module\_gcs\_bucket) | ../cloud_storage | n/a |
| <a name="module_gcs_sink"></a> [gcs\_sink](#module\_gcs\_sink) | terraform-google-modules/log-export/google | 7.4.2 |
| <a name="module_logging_bucket_config"></a> [logging\_bucket\_config](#module\_logging\_bucket\_config) | terraform-google-modules/log-export/google//modules/logbucket | 7.4.2 |
| <a name="module_logging_bucket_sink"></a> [logging\_bucket\_sink](#module\_logging\_bucket\_sink) | terraform-google-modules/log-export/google | 7.4.2 |
| <a name="module_pubsub_sink"></a> [pubsub\_sink](#module\_pubsub\_sink) | terraform-google-modules/log-export/google | 7.4.2 |
| <a name="module_pubsub_topic"></a> [pubsub\_topic](#module\_pubsub\_topic) | ../pubsub | n/a |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_billing_bucket_sink_writer_identity"></a> [billing\_bucket\_sink\_writer\_identity](#output\_billing\_bucket\_sink\_writer\_identity) | The identity associated with this sink. This identity must be granted write access to the configured destination (addressed by this module) |
| <a name="output_billing_logging_bucket_sink_writer_identity"></a> [billing\_logging\_bucket\_sink\_writer\_identity](#output\_billing\_logging\_bucket\_sink\_writer\_identity) | The identity associated with this sink. This identity must be granted write access to the configured destination (addressed by this module) |
| <a name="output_billing_pubsub_sink_writer_identity"></a> [billing\_pubsub\_sink\_writer\_identity](#output\_billing\_pubsub\_sink\_writer\_identity) | The identity associated with this sink. This identity must be granted write access to the configured destination (addressed by this module) |
| <a name="output_gcs_bucket"></a> [gcs\_bucket](#output\_gcs\_bucket) | n/a |
| <a name="output_gcs_sink"></a> [gcs\_sink](#output\_gcs\_sink) | n/a |
| <a name="output_logging_bucket_config"></a> [logging\_bucket\_config](#output\_logging\_bucket\_config) | n/a |
| <a name="output_logging_bucket_sink"></a> [logging\_bucket\_sink](#output\_logging\_bucket\_sink) | n/a |
| <a name="output_pubsub_sink"></a> [pubsub\_sink](#output\_pubsub\_sink) | n/a |
| <a name="output_pubsub_topic"></a> [pubsub\_topic](#output\_pubsub\_topic) | n/a |
