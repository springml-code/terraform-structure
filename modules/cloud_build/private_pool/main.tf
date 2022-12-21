resource "google_cloudbuild_worker_pool" "pool" {
  name     = var.name
  location = var.location
  project  = var.project_id
  worker_config {
    disk_size_gb   = var.disk_size_gb
    machine_type   = var.machine_type
    no_external_ip = true
  }
  network_config {
    peered_network = var.peered_network
  }
}