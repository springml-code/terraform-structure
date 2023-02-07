project_id = "cloud-build-common-1884"
ci_cd_service_account_email = "sa-terraform-ci-cd@cloud-build-common-1884.iam.gserviceaccount.com"

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
    }
}