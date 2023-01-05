
output "members" {
  value       = distinct(module.storage_bucket_iam_bindings.members)
  description = "Members which were bound to the Storage Bucket."
}