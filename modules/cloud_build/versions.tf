terraform {
  required_version = ">= 0.13"
  required_providers {

    google = {
      source  = "hashicorp/google"
      version = ">= 4.8.0, < 5.0"
    }

    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.8.0, < 5.0"
    }
  }

  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-composer:create_environment_v2/v3.3.0"
  }

  provider_meta "google-beta" {
    module_name = "blueprints/terraform/terraform-google-composer:create_environment_v2/v3.3.0"
  }

}