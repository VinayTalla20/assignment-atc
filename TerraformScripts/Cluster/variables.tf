variable "cluster_name" {
  description = "The name of the Kubernetes cluster."
  type        = string
}

variable "infraLocation" {
  description = "The location/region where the cluster will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group containing the cluster."
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the Kubernetes cluster."
  type        = string
}

variable "systemnpname" {
  description = "The name of the default node pool."
  type        = string
}

variable "aks_service_principal_app_id" {
  description = "The client ID for the service principal used by AKS."
  type        = string
}

variable "aks_service_principal_client_secret" {
  description = "The client secret for the service principal used by AKS."
  type        = string
  sensitive   = true
}

variable "aks_service_principal_tenant_id" {
  type = string
}

variable "systemnpcount" {
  type    = number
  default = 2
}

variable "vm_size" {
  type = string
}

variable "nodepool_os_disk_size" {
  type    = number
  default = 128
}

variable "defaultNodepool_Subnet_id" {
  type = string
}

variable "kubernetes_version" {
  type = string
}