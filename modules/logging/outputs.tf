output "gcs_sink" {
  value = module.gcs_sink
}

output "gcs_bucket" {
  value = module.gcs_bucket
}

output "logging_bucket_config" {
  value = module.logging_bucket_config
}

output "logging_bucket_sink" {
  value = module.logging_bucket_sink
}
output "pubsub_sink" {
  value = module.pubsub_sink
}

output "pubsub_topic" {
  value = module.pubsub_topic
}

output "billing_bucket_sink_writer_identity" {
  value       = { for i in google_logging_billing_account_sink.bucket : i.name => i.writer_identity }
  description = "The identity associated with this sink. This identity must be granted write access to the configured destination (addressed by this module)"
}

output "billing_pubsub_sink_writer_identity" {
  value       = { for i in google_logging_billing_account_sink.pubsub : i.name => i.writer_identity }
  description = "The identity associated with this sink. This identity must be granted write access to the configured destination (addressed by this module)"
}

output "billing_logging_bucket_sink_writer_identity" {
  value       = { for i in google_logging_billing_account_sink.logging_bucket : i.name => i.writer_identity }
  description = "The identity associated with this sink. This identity must be granted write access to the configured destination (addressed by this module)"
}