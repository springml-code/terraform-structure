module "alerting" {
  source                     = "../"
  project_id                 = var.project_id
  log_metric_config          = var.log_metric_config
  alert_policy_config        = var.alert_policy_config
  notif_channel_name         = var.notif_channel_name
  notif_channel_type         = var.notif_channel_type
  notif_channel_labels       = var.notif_channel_labels
  notif_channel_force_delete = var.notif_channel_force_delete
}