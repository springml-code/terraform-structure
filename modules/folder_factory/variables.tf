################# variables for creating folders #############################

variable "spoke_folder" {
  description = "Name of the parent folder of the spoke project"
  type        = string
}

variable "env_folders" {
  description = "List of sub folders under the parent spoke-project folder"
  type        = map(string)
}

variable "tn_data_folder_id" {
  description = "TN-DATA Folder Id"
  type        = string
}
######################### Variables for assigning the roles to terraform project sa on prod and non-prod folders ###############

variable "non_prod_folder_iam_bindings" {
  description = "Map of role (key) and list of members (value) to add the IAM policies/bindings to non prod folder"
  type        = map(list(string))
}

variable "prod_folder_iam_bindings" {
  description = "Map of role (key) and list of members (value) to add the IAM policies/bindings to the prod folder"
  type        = map(list(string))
}
