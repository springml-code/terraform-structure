module "bigquery" {
  source  = "terraform-google-modules/bigquery/google"
  version = "~> 4.4"

  dataset_id                  = var.dataset_id
  dataset_name                = var.dataset_name
  description                 = var.description
  project_id                  = var.project_id
  location                    = var.location
  default_table_expiration_ms = var.default_table_expiration_ms
  tables                      = var.tables
  views                       = var.views
  dataset_labels              = var.dataset_labels
  access                      = var.access
  delete_contents_on_destroy  = var.delete_contents_on_destroy
  encryption_key              = var.encryption_key
  external_tables             = var.external_tables
}