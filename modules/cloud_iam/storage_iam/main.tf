module "storage_bucket_iam_bindings" {
  source          = "terraform-google-modules/iam/google//modules/storage_buckets_iam"
  storage_buckets = var.storage_buckets
  mode            = "additive"

  bindings             = var.bindings
  conditional_bindings = var.conditional_bindings
}
