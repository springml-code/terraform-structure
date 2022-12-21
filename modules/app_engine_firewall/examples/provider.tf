terraform {
  required_version = ">= 0.13.6"
  required_providers {
    google = "~> 3.69"
  }
}

provider "google" {
  project = var.project_id
}