
output "service_account" {
  description = "Service account resource (for single use)."
  value       = module.service_account.service_account
}

output "email" {
  description = "Service account email (for single use)."
  value       = module.service_account.email
}

output "iam_email" {
  description = "IAM-format service account email (for single use)."
  value       = module.service_account.iam_email
}