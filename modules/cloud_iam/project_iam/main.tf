module "project-iam-bindings" {
  source   = "terraform-google-modules/iam/google//modules/projects_iam"
  projects = var.project_names
  mode     = var.project_iam_mode

  bindings = var.project_iam_bindings

  conditional_bindings = var.project_conditional_bindings
}