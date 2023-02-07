project_id = "cloud-build-common-1884"
cb_triggers = {
    "network_project_creator_pull_trigger" = {
        branch_name = "^dev$"
        cloudbuild_yaml = "./common-cloudbuild-pr.yaml"
        github_owner = "springml-code"
        github_repo_name = "terraform-structure"
        included_files = [
            "common/network-project/**"
        ]
        substitutions = {
            _MODULE = "common/network-project/"
        }
        trigger_description = "Pipeline to plan network project creation"
        trigger_name = "network-project-creator-pipeline-pr"
        trigger_type = "pull"
        service_account_email = "sa-terraform-net@terraform-project-common-4108.iam.gserviceaccount.com"
        service_account_project_id = "terraform-project-common-4108"
    }
    "network_project_creator_push_trigger" = {
        branch_name = "^main$"
        cloudbuild_yaml = "./common-cloudbuild-push.yaml"
        github_owner = "springml-code"
        github_repo_name = "terraform-structure"
        included_files = [
            "common/network-project/**"
        ]
        substitutions = {
            _MODULE = "common/network-project/"
        }
        trigger_description = "Pipeline to apply network project creation"
        trigger_name = "network-project-creator-pipeline-push"
        trigger_type = "push"
        service_account_email = "sa-terraform-net@terraform-project-common-4108.iam.gserviceaccount.com"
        service_account_project_id = "terraform-project-common-4108"
    }
}