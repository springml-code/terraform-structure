resource "google_logging_billing_account_sink" "bucket" {
  for_each = var.billing_gcs

  name            = each.value.log_sink_name
  billing_account = each.value.billing_account
  filter          = each.value.filter
  destination     = "storage.googleapis.com/${each.value.bucket_name}"

  depends_on = [module.gcs_bucket]
}

resource "google_storage_bucket_iam_member" "storage_sink_member_billing" {
  for_each = var.billing_gcs

  bucket = each.value.bucket_name
  role   = "roles/storage.objectCreator"
  member = google_logging_billing_account_sink.bucket[each.key].writer_identity
}

resource "google_logging_billing_account_sink" "pubsub" {
  for_each = var.billing_pubsub

  name            = each.value.log_sink_name
  billing_account = each.value.billing_account
  filter          = each.value.filter
  destination     = "pubsub.googleapis.com/projects/${each.value.logging_project}/topics/${each.value.topic_name}"

  depends_on = [module.pubsub_topic]
}

resource "google_pubsub_topic_iam_member" "pubsub_sink_member_billing" {
  for_each = var.billing_pubsub

  project = each.value.logging_project
  topic   = each.value.topic_name
  role    = "roles/pubsub.publisher"
  member  = google_logging_billing_account_sink.pubsub[each.key].writer_identity
}

resource "google_logging_billing_account_sink" "logging_bucket" {
  for_each = var.billing_logging_bucket

  name            = each.value.log_sink_name
  billing_account = each.value.billing_account
  filter          = each.value.filter
  destination     = "logging.googleapis.com/projects/${each.value.logging_project}/locations/${each.value.location}/buckets/${each.value.bucket_name}"

  depends_on = [module.logging_bucket_config]
}