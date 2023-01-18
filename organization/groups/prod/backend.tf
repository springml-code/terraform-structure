terraform {
  backend "gcs" {
    bucket                      = ""
    prefix                      = "groups-prod/resources"
    impersonate_service_account = ""
  }
}