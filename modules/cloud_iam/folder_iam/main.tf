module "folder_iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  folders = var.folders

  mode = "additive"

  bindings = var.bindings

  conditional_bindings = var.conditional_bindings
}