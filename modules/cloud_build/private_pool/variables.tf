variable "name" {
  type        = string
  description = "Name of private worker pool"
}

variable "location" {
  type        = string
  description = "Location of worker pool"
}

variable "disk_size_gb" {
  type        = number
  description = "Disk size of worker nodes"
}

variable "machine_type" {
  type        = string
  description = "Machine type of worker nodes"
}

variable "project_id" {
  type        = string
  description = "Project ID for the resource"
}

variable "peered_network" {
  type        = string
  description = "Peered Network of the format - projects/{project}/global/network/{network}"
}