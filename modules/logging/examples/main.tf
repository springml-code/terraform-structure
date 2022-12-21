module "logging" {
  source = "../"

  billing_gcs            = var.billing_gcs
  billing_logging_bucket = var.billing_logging_bucket
  billing_pubsub         = var.billing_pubsub
  gcs                    = var.gcs
  logging_bucket         = var.logging_bucket
  pubsub                 = var.pubsub
}