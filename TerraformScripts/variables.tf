variable "kubernetes_version" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "environment_tag" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "infraLocation" {
  type = string
}

variable "acr_name" {
  type = string
}

#AAD details
variable "aks_service_principal_app_id" {
  type = string
}

variable "aks_service_principal_client_secret" {
  type = string
}

variable "aks_service_principal_tenant_id" {
  type = string
}

variable "aks_service_subscription_id" {
  type = string
}

variable "virtualNetworkCIDR_Range" {
  type = list(string)
}

variable "securityGroupName" {
  type = string
}

variable "systemnpcount" {
  type = number
}

variable "systemnpname" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "nodepool_os_disk_size" {
  type = string
}

variable "defaultSubnetCIDR_Range" {
  type = list(string)
}

variable "virtualNetworkName" {
  type = string
}

variable "UserAssignedIdentityName" {
  type = string
}

variable "backend_storage_account" {
  type = string
}

variable "backend_container" {
  type = string
}

variable "backend_key" {
  type = string
}

variable "backend_client_id" {
  type = string

}

variable "backend_subscription_id" {
  type = string
}

variable "backend_tenant_id" {
  type = string
}
