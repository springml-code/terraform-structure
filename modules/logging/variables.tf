variable "gcs" {
  description = "Cloud Storage configuration"
  type = map(object({
    exclusions = list(object({
      name        = string,
      description = string,
      filter      = string,
      disabled    = bool
    })) // A list of sink exclusion filters.
    bucket_name           = string
    filter                = string // The filter to apply when exporting logs. Only log entries that match the filter are exported. '' which exports all logs.
    folder_id             = number // The folder ID of the GCP resource in which you create the log sink.
    kms_key_name          = string // 	ID of a Cloud KMS key that will be used to encrypt objects inserted into this bucket. Automatic Google Cloud Storage service account for the bucket's project requires access to this encryption key.
    include_children      = bool   // Only valid if 'organization' or 'folder' is chosen as var.parent_resource.type. Determines whether or not to include children organizations/folders in the sink export. If true, logs associated with child projects are also exported; otherwise only logs relating to the provided organization/folder are included.
    location              = string
    log_sink_name         = string // The name of the log sink to be created.
    logging_project       = string // The ID of the project in which the bucket will be created.
    retention_period_days = number
  }))
  default = {}
}

variable "logging_bucket" {
  description = "Logging Bucket configuration"
  type = map(object({
    bucket_name = string, // The name of the logging bucket to create.
    exclusions = list(object({
      name        = string,
      description = string,
      filter      = string,
      disabled    = bool
    }))                       // A list of sink exclusion filters.
    filter           = string // The filter to apply when exporting logs. Only log entries that match the filter are exported. '' which exports all logs.
    folder_id        = number // The folder ID of the GCP resource in which you create the log sink.
    include_children = bool   // Only valid if 'organization' or 'folder' is chosen as var.parent_resource.type. Determines whether or not to include children organizations/folders in the sink export. If true, logs associated with child projects are also exported; otherwise only logs relating to the provided organization/folder are included.
    location         = string // The geographic location where the dataset should reside. https://cloud.google.com/bigquery/docs/locations
    log_sink_name    = string // The name of the log sink to be created.
    logging_project  = string // The ID of the project in which the dataset will be created.
    retention_days   = number // Logs will be retained by default for this amount of time, after which they will automatically be deleted. The minimum retention period is 1 day. If this value is set to zero at bucket creation time, the default time of 30 days will be used.
  }))
  default = {}
}

variable "pubsub" {
  description = "pubsub configuration"
  type = map(object({
    exclusions = list(object({
      name        = string,
      description = string,
      filter      = string,
      disabled    = bool
    }))                                    // A list of sink exclusion filters.
    filter             = string            // The filter to apply when exporting logs. Only log entries that match the filter are exported. '' which exports all logs.
    folder_id          = number            // The folder ID of the GCP resource in which you create the log sink.
    include_children   = bool              // Only valid if 'organization' or 'folder' is chosen as var.parent_resource.type. Determines whether or not to include children organizations/folders in the sink export. If true, logs associated with child projects are also exported; otherwise only logs relating to the provided organization/folder are included.
    kms_key_name       = string            // ID of a Cloud KMS CryptoKey to be used to protect access to messages published on this topic. Your project's PubSub service account requires access to this encryption key.
    log_sink_name      = string            // The name of the log sink to be created.
    logging_project    = string            // The ID of the project in which the pubsub topic will be created.
    topic_name         = string            // The name of the pubsub topic to be created and used for log entries matching the filter.
    pull_subscriptions = list(map(string)) // The names of subscriptions to create
  }))
  default = {}
}

variable "billing_logging_bucket" {
  description = "Billing configuration. You must have the Logs Configuration Writer IAM role (roles/logging.configWriter) granted on the billing account to the credentials used with Terraform. IAM roles granted on a billing account are separate from the typical IAM roles granted on a project."
  type = map(object({
    bucket_name     = string // must match a bucket name defined in var.gcs                         // A list of sink exclusion filters.
    filter          = string // The filter to apply when exporting logs. Only log entries that match the filter are exported. '' which exports all logs.
    billing_account = string // The Billing Account ID of the GCP resource in which you create the log sink.
    log_sink_name   = string // The name of the log sink to be created.
    logging_project = string // The ID of the project in which the dataset will be created.
    location        = string
  }))
  default = {}
}

variable "billing_pubsub" {
  description = "Billing configuration. You must have the Logs Configuration Writer IAM role (roles/logging.configWriter) granted on the billing account to the credentials used with Terraform. IAM roles granted on a billing account are separate from the typical IAM roles granted on a project."
  type = map(object({
    topic_name      = string // must match a bucket name defined in var.gcs                         // A list of sink exclusion filters.
    filter          = string // The filter to apply when exporting logs. Only log entries that match the filter are exported. '' which exports all logs.
    billing_account = string // The Billing Account ID of the GCP resource in which you create the log sink.
    log_sink_name   = string // The name of the log sink to be created.
    logging_project = string // The ID of the project in which the dataset will be created.
  }))
  default = {}
}

variable "billing_gcs" {
  description = "Billing configuration. You must have the Logs Configuration Writer IAM role (roles/logging.configWriter) granted on the billing account to the credentials used with Terraform. IAM roles granted on a billing account are separate from the typical IAM roles granted on a project."
  type = map(object({
    bucket_name     = string // must match a bucket name defined in var.gcs                         // A list of sink exclusion filters.
    filter          = string // The filter to apply when exporting logs. Only log entries that match the filter are exported. '' which exports all logs.
    billing_account = string // The Billing Account ID of the GCP resource in which you create the log sink.
    log_sink_name   = string // The name of the log sink to be created.
    logging_project = string // The ID of the project in which the dataset will be created.
  }))
  default = {}
}