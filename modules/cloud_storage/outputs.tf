output "bucket_name" {
  description = "Name of bucket created (single resource)"
  value       = module.gcs_buckets.name
}

output "bucket_names" {
  description = "List of names of buckets created"
  value       = module.gcs_buckets.names_list
}

output "url" {
  description = "Bucket URL for single resource"
  value       = module.gcs_buckets.url
}

output "urls" {
  description = "List of bucket URLs "
  value       = module.gcs_buckets.urls_list
}
