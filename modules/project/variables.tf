variable "project_name" {
  description = "Project name"
  type        = string
}

variable "org_id" {
  description = "Organization ID"
  type        = string
}

variable "billing_account" {
  description = "Billing Account ID"
  type        = string
}

variable "folder_id" {
  description = "Folder ID"
  type        = string
}

variable "activate_apis" {
  description = "APIs to activate"
  type        = list(string)
}

variable "tf_state_bucket_name" {
  description = "Bucket name for the exisiting tf state bucket for the env"
  type        = string
  default     = null
}



##################### Variables for project state bucket ####################

variable "is_state_bucket_created" {
  description = "To check if state bucket is created"
  type        = bool
  default     = true
}


###################### Optional variables ###################################

variable "random_project_id" {
  description = "Random id for suffix"
  type        = bool
  default     = false
}

variable "enable_shared_vpc" {
  description = "Whether to enable shared vpc or not"
  type        = bool
  default     = false
}

variable "grant_network_role" {
  description = "Whether to grant the project sa network role or not"
  type        = bool
  default     = false
}

variable "attach_vpc_service_control" {
  description = "Whether to attach vpc sc "
  type        = string
  default     = false
}

variable "vpc_service_control_parameter_name" {
  description = "VPC SC perimeter name"
  type        = string
  default     = null
}

variable "default_service_account" {
  description = "Whether to keep, disable or delete default project service account"
  type        = string
  default     = "disable"
}

variable "sa_role" {
  description = "what role to give to project default service account"
  type        = string
  default     = ""
}

variable "project_sa_name" {
  description = "Name of project default service account"
  type        = string
  default     = ""
}

############### Variables for creating service project ###################

variable "svpc_host_project_id" {
  description = "The ID of the network host project which hosts the shared VPC"
  type        = string
  default     = ""
}

variable "spoke_subnet" {
  description = "List of subnets fully qualified subnet IDs (ie. projects/$project_id/regions/$region/subnetworks/$subnet_id)"
  type        = list(string)
  default     = []
}

variable "enable_shared_vpc_service_project" {
  description = "Whether to enable shared vpc service project or not"
  type        = bool
  default     = false
}




##################### Variables for adding permissions on default sa in service project ####################

variable "tf_sa_project_iam_bindings" {
  description = "Map of role (key) and list of members (value) to add the IAM policies/bindings"
  type        = map(list(string))
  default     = {}
}

################# bindings for tf-state-bucket for spoke-project ################

variable "storage_bindings" {
  description = "Map of role (key) and list of members (value) to add the IAM policies/bindings to storage buckets"
  type        = map(list(string))
  default     = {}
}

################## bindings for cloudbuild sa on spoke-project sa ################

variable "sa_bindings" {
  description = "Map of role (key) and list of members (value) to add the IAM policies/bindings to service account"
  type        = map(list(string))
  default     = null
}