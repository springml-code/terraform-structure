module "pubsub" {
  source  = "terraform-google-modules/pubsub/google"
  version = "~> 5.0"

  topic                            = var.topic
  project_id                       = var.project_id
  push_subscriptions               = var.push_subscriptions
  pull_subscriptions               = var.pull_subscriptions
  bigquery_subscriptions           = var.bigquery_subscriptions
  create_subscriptions             = var.create_subscriptions
  create_topic                     = var.create_topic
  grant_token_creator              = var.grant_token_creator
  message_storage_policy           = var.message_storage_policy
  schema                           = var.schema
  subscription_labels              = var.subscription_labels
  topic_kms_key_name               = var.topic_kms_key_name
  topic_labels                     = var.topic_labels
  topic_message_retention_duration = var.topic_message_retention_duration
}