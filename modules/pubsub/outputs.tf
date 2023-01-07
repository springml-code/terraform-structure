output "id" {
  value       = module.pubsub.id
  description = "ID of pubsub topic"
}

output "subscription_names" {
  value       = module.pubsub.subscription_names
  description = "The name list of Pub/Sub subscriptions"
}

output "subscription_paths" {
  value       = module.pubsub.subscription_paths
  description = "The path list of Pub/Sub subscriptions"
}

output "topic" {
  value       = module.pubsub.topic
  description = "The name of the Pub/Sub topic"
}

output "topic_labels" {
  value       = module.pubsub.topic_labels
  description = "Labels assigned to the Pub/Sub topic"
}

output "uri" {
  value       = module.pubsub.uri
  description = "The URI of the Pub/Sub topic"
}
