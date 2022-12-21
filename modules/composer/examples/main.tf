module "composer" {
  source            = "../"
  project_id        = var.project_id
  region            = var.region
  composer_env_name = var.composer_env_name
  network           = var.network
  subnetwork        = var.subnetwork
}