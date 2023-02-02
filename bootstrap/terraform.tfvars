organization_id = "600822357351"
billing_account = "019AA9-0890B0-203A1A"
root_folders = {
  "bootstrap" = "bootstrap"
  "project"   = "springml-sample"
  "shared"    = "shared"
}

project_folders = {
  "dev"      = "springml-sample"
  "non-prod" = "springml-sample"
  "prod"     = "springml-sample"
}

bootstrap_folder_iam_bindings = {
  "roles/resourcemanager.projectCreator" = [
    "user:akash.das@springml.com"
  ]
}

bootstrap_projects = {
  "terraform-project" = {
    apis = [
      "storage.googleapis.com",
      "iam.googleapis.com",
    ]
    project_sa_name = "tf-project-sa"
  }
  "common-cloud-build" = {
    apis = [
      "cloudbuild.googleapis.com",
      "storage.googleapis.com",
      "iam.googleapis.com",
    ]
    project_sa_name = "cloudbuild-project-sa"
  }
}