/*
This configures a folder-level log sink that feeds a storage bucket.
The storage class is hardcoded to COLDLINE
The lifecycle rule deletes objects after the defined retention period.
Objects stored in the bucket are LOCKED by a retention policy
Reference code:
  https://github.com/terraform-google-modules/terraform-google-log-export/tree/v7.4.2/modules/storage
*/
module "gcs_sink" {
  for_each = var.gcs

  source  = "terraform-google-modules/log-export/google"
  version = "7.4.2"

  destination_uri        = "storage.googleapis.com/${module.gcs_bucket[each.key].bucket_name}"
  exclusions             = each.value.exclusions
  filter                 = each.value.filter
  include_children       = each.value.include_children
  log_sink_name          = each.value.log_sink_name
  parent_resource_id     = each.value.folder_id
  parent_resource_type   = "folder"
  unique_writer_identity = true
}

module "gcs_bucket" {
  for_each = var.gcs

  source               = "../cloud_storage"
  encryption_key_names = { (each.value.bucket_name) = each.value.kms_key_name }

  lifecycle_rules = [
    {
      action = {
        type = "Delete"
      }
      condition = {
        age        = each.value.retention_period_days
        with_state = "ANY"
      }
    }
  ]
  location   = each.value.location
  project_id = each.value.logging_project
  retention_policy = {
    is_locked             = true
    retention_period_days = each.value.retention_period_days
  }
  names         = [each.value.bucket_name]
  storage_class = "COLDLINE"
}

/*
This is required to workround the circular dependency since module.gcs_sink creates the SA and
module.gcs_bucket URI output needs to feed module.gcs_sink.
*/
resource "google_storage_bucket_iam_member" "storage_sink_member" {
  for_each = var.gcs

  bucket = each.value.bucket_name
  role   = "roles/storage.objectCreator"
  member = module.gcs_sink[each.key].writer_identity

  depends_on = [module.gcs_bucket]
}