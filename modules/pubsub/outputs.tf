output "project_id" {
  value       = var.project_id
  description = "The project ID"
}

output "topic" {
  value = [
    for topic in google_pubsub_topic.topic :
    topic.name
  ]
}


output "subscription" {
  value = [
    for sub in google_pubsub_subscription.pull_subscriptions :
    sub.name
  ]
}