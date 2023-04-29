terraform {
  backend "gcs" {
    bucket = "cloud-build-tf-state-common"
    prefix = "resources/triggers"
  }
}