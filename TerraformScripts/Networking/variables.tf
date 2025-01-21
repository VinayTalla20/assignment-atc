variable "infraLocation" {
  description = "The location/region where the cluster will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group containing the cluster."
  type        = string
}

variable "environment_tag" {
  type = string
}

variable "virtualNetworkName" {
  type = string
}

variable "virtualNetworkCIDR_Range" {
  type = list(string)
}

variable "defaultSubnetCIDR_Range" {
  type = list(string)
}

variable "securityGroupName" {
  type = string
}