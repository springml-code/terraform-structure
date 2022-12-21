/*
This  configures a folder-level log sink that feeds a  Logging Log bucket destination.
The resource that create the logging sink automatically create the bucket. The bucket is hidden from GCS console.
Ref:
  https://github.com/terraform-google-modules/terraform-google-log-export/tree/v7.4.2/modules/logbucket
  https://github.com/terraform-google-modules/terraform-google-log-export/tree/v7.4.2/examples/bigquery/folder
*/
module "logging_bucket_sink" {
  for_each = var.logging_bucket
  version  = "7.4.2"
  source   = "terraform-google-modules/log-export/google"

  destination_uri        = "logging.googleapis.com/projects/${each.value.logging_project}/locations/${each.value.location}/buckets/${each.value.bucket_name}"
  exclusions             = each.value.exclusions
  filter                 = each.value.filter
  include_children       = each.value.include_children
  log_sink_name          = each.value.log_sink_name
  parent_resource_id     = each.value.folder_id
  parent_resource_type   = "folder"
  unique_writer_identity = true
}

module "logging_bucket_config" {
  for_each = var.logging_bucket
  version  = "7.4.2"
  source   = "terraform-google-modules/log-export/google//modules/logbucket"

  location                 = each.value.location
  log_sink_writer_identity = module.logging_bucket_sink[each.key].writer_identity
  name                     = each.value.bucket_name
  project_id               = each.value.logging_project
  retention_days           = each.value.retention_days
}