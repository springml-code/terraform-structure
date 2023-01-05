

module "project_factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name              = var.project_name
  random_project_id = var.random_project_id
  org_id            = var.org_id
  billing_account   = var.billing_account
  activate_apis     = var.activate_apis

  svpc_host_project_id = var.svpc_host_project_id
  shared_vpc_subnets   = var.spoke_subnet

  folder_id = var.folder_id

  vpc_service_control_attach_enabled = var.attach_vpc_service_control
  vpc_service_control_perimeter_name = var.vpc_service_control_parameter_name

  default_service_account = var.default_service_account
  sa_role                 = var.sa_role
  project_sa_name         = var.project_sa_name
}


################# project state bucket creation ##################

module "state_bucket" {
  count  = var.is_state_bucket_created ? 1 : 0
  source = "../cloud_storage"

  project_id      = var.project_name
  names           = [local.project_state_bucket_name]
  location        = local.location
  versioning      = local.versioning
  lifecycle_rules = local.lifecycle_rules
}

########## assigning roles for default SA created on the project

module "tf_sa_project_iam" {
  count                = local.sa_created ? 1 : 0
  source               = "../cloud_iam"
  project_names        = [module.project_factory.project_id]
  project_iam_bindings = var.tf_sa_project_iam_bindings
}

####### assigning roles for default SA created on the tf state bucket

module "tf_state_bucket_iam_bindings" {
  count           = local.is_tf_state_bucket ? 1 : 0
  source          = "../cloud_iam/storage"
  storage_buckets = [var.tf_state_bucket_name]
  bindings        = var.storage_bindings
  depends_on = [
    module.project_factory
  ]

}
