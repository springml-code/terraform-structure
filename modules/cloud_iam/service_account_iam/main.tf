module "service_account-iam-bindings" {
  source = "terraform-google-modules/iam/google//modules/service_accounts_iam"

  service_accounts     = var.service_accounts
  project              = var.project_id
  mode                 = var.mode
  bindings             = var.bindings
  conditional_bindings = var.conditional_bindings
}