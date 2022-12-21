variable "alert_policy_config" {
  description = "Alert policy configuration"
  type = map(object({
    display_name       = string
    combiner           = string
    condition_name     = string
    condition_duration = string
    labels             = map(string)
    alerting_message   = string
  }))
}

variable "log_metric_config" {
  description = "User logging metric configuration"
  type = map(object({
    filter = string
  }))
}

variable "notif_channel_name" {
  description = "Display name for the Notification Channel"
  type        = string
}

variable "notif_channel_type" {
  description = "The type of the Notification Channel. Acceptable values are: campfire, email, hipchat, pagerduty, pubsub, slack, sms, webhook_basicauth, webhook_tokenauth"
  type        = string
}

variable "notif_channel_labels" {
  description = "Labels for the Notification Channel"
  type        = map(string)
}

variable "notif_channel_force_delete" {
  description = "Force delete flag for the Notification Channel"
  type        = bool
}

variable "project_id" {
  description = "GCP project ID where all the resources will be created"
  type        = string
}