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

bootstrap_projects = {
  "terraform-project-common" = {
    apis = [
      "storage.googleapis.com",
      "iam.googleapis.com",
    ]
    project_sa_name = "tf-folder-admin-sa"
  }
}

common_projects = {
  "cloud-build-common" = {
      apis = [
        "serviceusage.googleapis.com",
        "servicenetworking.googleapis.com",
        "compute.googleapis.com",
        "logging.googleapis.com",
        "iam.googleapis.com",
        "admin.googleapis.com",
        "sourcerepo.googleapis.com",
        "workflows.googleapis.com",
        "artifactregistry.googleapis.com",
        "cloudbuild.googleapis.com",
        "cloudscheduler.googleapis.com",
        "bigquery.googleapis.com",
        "cloudresourcemanager.googleapis.com",
        "cloudbilling.googleapis.com",
        "appengine.googleapis.com",
        "storage-api.googleapis.com",
        "billingbudgets.googleapis.com",
        "dns.googleapis.com"
      ]
      project_sa_name = "cloudbuild-project-sa"
    }
}

cb_resources_trigger = {
  "cb_trigger_creator_pull_trigger" = {
    branch_name = "^dev$"
    cloudbuild_yaml = "./common-cloudbuild-pr.yaml"
    github_owner = "springml-code"
    github_repo_name = "terraform-structure"
    included_files = [
      "common/cloudbuild-resources/**"
    ]
    substitutions = {
      _MODULE = "common/cloudbuild-resources/"
    }
    trigger_description = "Pipeline to plan new triggers in shared cloud build project"
    trigger_name = "trigger-creator-pipeline-pr"
    trigger_type = "pull"
  }
  "cb_trigger_creator_push_trigger" = {
    branch_name = "^main$"
    cloudbuild_yaml = "./common-cloudbuild-push.yaml"
    github_owner = "springml-code"
    github_repo_name = "terraform-structure"
    included_files = [
      "common/cloudbuild-resources/**"
    ]
    substitutions = {
      _MODULE = "common/cloudbuild-resources/"
    }
    trigger_description = "Pipeline to apply new triggers in shared cloud build project"
    trigger_name = "trigger-creator-pipeline-push"
    trigger_type = "push"
  }
}

foundation_sa_iam_bindings = {
  "roles/iam.serviceAccountTokenCreator" = [
    "user:akash.das@springml.com"
  ]
}