
module "custom_roles" {
  source = "terraform-google-modules/iam/google//modules/custom_role_iam"

  target_level         = var.target_level
  target_id            = var.target_id
  role_id              = var.role_id
  title                = var.title
  description          = var.description
  base_roles           = var.base_roles
  permissions          = var.permissions
  excluded_permissions = var.excluded_permissions
  members              = var.members
} 