resource "google_logging_metric" "user_metric" {
  for_each = var.log_metric_config
  name     = "${each.key}-metric"
  filter   = each.value.filter
  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
  }
}

#Notification channel for the Alerting policies
resource "google_monitoring_notification_channel" "notif_channel" {
  display_name = var.notif_channel_name
  type         = var.notif_channel_type
  labels       = var.notif_channel_labels
  force_delete = var.notif_channel_force_delete
}

resource "google_monitoring_alert_policy" "alert_policy" {
  for_each              = var.alert_policy_config
  display_name          = each.value.display_name
  combiner              = each.value.combiner
  notification_channels = [google_monitoring_notification_channel.notif_channel.name]
  conditions {
    display_name = each.value.condition_name
    condition_threshold {
      filter     = "metric.type=\"logging.googleapis.com/user/${google_logging_metric.user_metric[each.key].name}\" AND resource.type=\"global\""
      duration   = each.value.condition_duration
      comparison = "COMPARISON_GT"
      aggregations {
        alignment_period = "60s"
        # cross_series_reducer = "REDUCE_COUNT"
        per_series_aligner = "ALIGN_RATE"
      }
    }
  }
  user_labels = each.value.labels
  documentation {
    mime_type = "text/markdown"
    content   = each.value.alerting_message
  }
}
