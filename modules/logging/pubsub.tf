/*
This configures a folder-level log sink that feeds pub/sub.
Reference code:
  https://github.com/terraform-google-modules/terraform-google-log-export/tree/v7.4.2/modules/pubsub
*/
module "pubsub_sink" {
  for_each = var.pubsub

  source  = "terraform-google-modules/log-export/google"
  version = "7.4.2"

  destination_uri        = "pubsub.googleapis.com/projects/${each.value.logging_project}/topics/${module.pubsub_topic[each.key].topic[0]}"
  exclusions             = each.value.exclusions
  filter                 = each.value.filter
  include_children       = each.value.include_children
  log_sink_name          = each.value.log_sink_name
  parent_resource_id     = each.value.folder_id
  parent_resource_type   = "folder"
  unique_writer_identity = true
}

module "pubsub_topic" {
  for_each = var.pubsub

  source = "../pubsub"

  topic_kms_key_name  = each.value.kms_key_name
  project_id          = each.value.logging_project
  topics              = [each.value.topic_name]
  pull_subscriptions  = each.value.pull_subscriptions
  grant_token_creator = false
}

/*
This is required to workround the circular dependency since module.pubsub_sink creates the SA and
module.pubsub_topic URI output needs to feed module.pubsub_sink.
*/
resource "google_pubsub_topic_iam_member" "pubsub_sink_member" {
  for_each = var.pubsub

  project = each.value.logging_project
  topic   = each.value.topic_name
  role    = "roles/pubsub.publisher"
  member  = module.pubsub_sink[each.key].writer_identity

  depends_on = [module.pubsub_topic]
}