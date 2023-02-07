module "triggers" {
  source              = "../modules"
  project_id          = var.project_id
  ci_cd_service_account_email     = var.ci_cd_service_account_email
  cb_triggers         = var.cb_triggers 
} 