locals {
  org_policies = {
    skipDefaultNetwork = {
      constraint = "constraints/compute.skipDefaultNetworkCreation"
      value      = true
      policy_for = "folder"
      folder_id  = module.initial_folders.root_folder["project"]
      project_id = null
    }
    defaultServiceAccountsGrant = {
      constraint = "constraints/iam.automaticIamGrantsForDefaultServiceAccounts"
      value      = true
      policy_for = "folder"
      folder_id  = module.initial_folders.root_folder["project"]
      project_id = null
    }
    disableCrossProjectSA = {
      constraint = "constraints/iam.disableCrossProjectServiceAccountUsage"
      value      = false
      policy_for = "project"
      project_id = module.bootstrap_projects["terraform-project-common"].project_id
      folder_id  = null
    }
  }
  initial_projects = {
    tf-common-project = module.bootstrap_projects["terraform-project-common"].project_id,
    common-cloud-build = module.common_projects["cloud-build-common"].project_id
  }
  granular_sa = {
    "bootstrap" = {
      project = module.bootstrap_projects["terraform-project-common"].project_id
      detail  = "Foundation Bootstrap SA. Managed by Terraform."
    }
    "org"       = {
      project = module.bootstrap_projects["terraform-project-common"].project_id
      detail  = "Foundation Organization SA. Managed by Terraform."
    }
    "env"       = {
      project = module.bootstrap_projects["terraform-project-common"].project_id
      detail  = "Foundation Environment SA. Managed by Terraform."
    }
    "net"       = {
      project = module.bootstrap_projects["terraform-project-common"].project_id
      detail  = "Foundation Network SA. Managed by Terraform."
    }
    "proj"      = {
      project = module.bootstrap_projects["terraform-project-common"].project_id
      detail  = "Foundation Projects SA. Managed by Terraform."
    }
    "ci-cd"     = {
      project = module.common_projects["cloud-build-common"].project_id
      detail  = "Foundation CI/CD SA. Managed by Terraform"
    }
  }

  common_roles = [
    "roles/browser", // Required for gcloud beta terraform vet to be able to read the ancestry of folders
  ]

  granular_sa_org_level_roles = {
    # "bootstrap" = distinct(concat([
    #   "roles/resourcemanager.organizationAdmin",
    #   "roles/accesscontextmanager.policyAdmin",
    #   "roles/serviceusage.serviceUsageConsumer",
    # ], local.common_roles)),
    "org" = distinct(concat([
      "roles/orgpolicy.policyAdmin",
      "roles/logging.configWriter",
      "roles/resourcemanager.organizationAdmin",
      "roles/securitycenter.notificationConfigEditor",
      "roles/resourcemanager.organizationViewer",
      "roles/accesscontextmanager.policyAdmin",
      "roles/essentialcontacts.admin",
      "roles/resourcemanager.tagAdmin",
      "roles/resourcemanager.tagUser",
    ], local.common_roles)),
    "env" = distinct(concat([
      "roles/resourcemanager.tagUser",
    ], local.common_roles)),
    "net" = distinct(concat([
      "roles/accesscontextmanager.policyAdmin",
      "roles/compute.xpnAdmin",
    ], local.common_roles)),
    "proj" = distinct(concat([
      "roles/accesscontextmanager.policyAdmin",
      #   "roles/resourcemanager.organizationAdmin",
      "roles/serviceusage.serviceUsageConsumer",
    ], local.common_roles)),
  }
  granular_sa_folder_level_roles = {
    # "bootstrap" = [
    #   "roles/resourcemanager.folderAdmin",
    # ],
    # "org" = [
    #   "roles/resourcemanager.folderAdmin",
    # ],
    "env" = [
      "roles/resourcemanager.folderAdmin"
    ],
    "net" = [
      "roles/resourcemanager.folderViewer",
      "roles/compute.networkAdmin",
      "roles/compute.securityAdmin",
      "roles/compute.orgSecurityPolicyAdmin",
      "roles/compute.orgSecurityResourceAdmin",
      "roles/dns.admin",
    ],
    "proj" = [
      "roles/resourcemanager.folderViewer",
      "roles/resourcemanager.folderIamAdmin",
      "roles/artifactregistry.admin",
      "roles/compute.networkAdmin",
      "roles/compute.xpnAdmin",
    ],
  }

  // Roles required to manage resources in the Seed project
  granular_sa_common_tf_project = {
    "bootstrap" = [
      "roles/storage.admin",
      "roles/iam.serviceAccountAdmin",
      "roles/resourcemanager.projectDeleter",
    ],
    "org" = [
      "roles/storage.objectAdmin",
    ],
    "env" = [
      "roles/storage.objectAdmin"
    ],
    "net" = [
      "roles/storage.objectAdmin",
    ],
    "proj" = [
      "roles/storage.objectAdmin",
    ],
    "ci-cd" = [
      "roles/storage.objectAdmin"
    ]
  }
  // Roles required to manage resources in the CI/CD project
  granular_sa_cicd_project = {
    "ci-cd" = [
      "roles/storage.admin",
      "roles/compute.networkAdmin",
      "roles/cloudbuild.builds.editor",
      "roles/cloudbuild.workerPoolOwner",
      "roles/artifactregistry.admin",
      "roles/source.admin",
      "roles/iam.serviceAccountAdmin",
      "roles/workflows.admin",
      "roles/cloudscheduler.admin",
      "roles/resourcemanager.projectDeleter",
      "roles/dns.admin",
      "roles/logging.logWriter"
    ],
  }
}