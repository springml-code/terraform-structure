################# variables for creating folders #############################

variable "spoke_folder" {
  description = "Name of the parent folder of the spoke project"
  type        = string
}

variable "env_folders" {
  description = "List of sub folders under the parent spoke-project folder"
  type        = map(string)
}

variable "parent_folder_id" {
  description = "Parent Folder Id"
  type        = string
}

