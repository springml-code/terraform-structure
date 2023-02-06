terraform {
  backend "gcs" {
    bucket                      = "cloud-build-tf-state-common"
    prefix                      = "resources/triggers"
    impersonate_service_account = "sa-terraform-ci-cd@cloud-build-common-1884.iam.gserviceaccount.com"
  }
}