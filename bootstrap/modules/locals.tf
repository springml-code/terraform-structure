locals {
  org_policies = [
    "constraints/compute.skipDefaultNetworkCreation",
    "constraints/iam.automaticIamGrantsForDefaultServiceAccounts"
  ]
}