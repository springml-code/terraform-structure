terraform {
  required_version = ">= 0.13.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "< 5.0, >= 3.83"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "< 5.0, >= 3.45"
    }
  }

  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-network/v6.0.0"
  }
}