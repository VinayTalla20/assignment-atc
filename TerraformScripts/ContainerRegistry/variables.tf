variable "locationk8s" {
  description = "The location/region where the cluster will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group containing the cluster."
  type        = string
}

variable "acr_name" {
  type = string
}