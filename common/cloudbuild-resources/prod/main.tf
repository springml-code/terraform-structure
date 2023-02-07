module "triggers" {
  source              = "../modules"
  project_id          = var.project_id
  cb_triggers         = var.cb_triggers 
}