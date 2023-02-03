provider "google" {
  request_timeout = "60s"
  region          = "us-central1"
}

provider "google-beta" {
  request_timeout = "60s"
  region          = "us-central1"
}
