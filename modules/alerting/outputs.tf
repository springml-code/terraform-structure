output "notif_verification_status" {
  value       = google_monitoring_notification_channel.notif_channel.verification_status
  description = "Verification status of the Notification channel"
}