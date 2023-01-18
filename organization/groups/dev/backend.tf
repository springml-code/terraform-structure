terraform {
  backend "gcs" {
    bucket                      = "" #bucket name
    prefix                      = "groups-dev/resources"
    impersonate_service_account = "" #Service account to impersonate
  }
}