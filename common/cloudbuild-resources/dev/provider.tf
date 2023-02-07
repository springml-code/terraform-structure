provider "google" {
  project                     = var.project_id
  request_timeout             = "60s"
  region                      = "us-central1"
}