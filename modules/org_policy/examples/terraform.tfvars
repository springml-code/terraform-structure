#NOTE: Organization policies can be applied at the GCP Folder level only

#Configure Org policies at folder level here
constraint       = "constraints/serviceuser.services"
policy_type      = "list"
folder_id        = "391304411253"
enforce          = true
policy_for       = "folder"
deny             = ["deploymentmanager.googleapis.com"]
deny_list_length = 1