
module "groups" {
  source = "../modules/resources"
  env    = var.env
  groups = var.groups
}