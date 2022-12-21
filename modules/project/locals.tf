locals {
  #conditional variables
  sa_created         = var.default_service_account == "keep" ? true : false
  is_tf_state_bucket = var.tf_state_bucket_name == null ? false : true
  is_sa_binding      = var.sa_bindings == null ? false : true

  # state bucket name from project name
  #This code takes project name, removes the environment from the end, then adds tf-state-[env] to the end.
  # state bucket naming convention : <project-name>-tf-state-<env>
  split_project_name          = split("-", var.project_name)
  project_state_bucket_prefix = join("-", slice(local.split_project_name, 0, length(local.split_project_name) - 1)) #removes <env> from project name

  #Adds tf-state-<env> to project_state_bucket_prefix var to form the bucket name
  project_state_bucket_name = join("-", [local.project_state_bucket_prefix, "tf-state", local.split_project_name[length(local.split_project_name) - 1]])


  #state bucket config
  location   = "US"
  versioning = { enabled = true }
  lifecycle_rules = [{
    action = {
      type = "Delete"
    }
    condition = {
      num_newer_versions = 5
      age                = 30
      with_state         = "ARCHIVED"
    }
  }]


}