module "resource_group" {
  source              = "./ResourceGroup"
  infraLocation       = var.infraLocation
  resource_group_name = var.resource_group_name
}

module "azure_cluster_networking" {
  source                   = "./Networking"
  environment_tag          = var.environment_tag
  infraLocation            = var.infraLocation
  resource_group_name      = var.resource_group_name
  securityGroupName        = var.securityGroupName
  virtualNetworkCIDR_Range = var.virtualNetworkCIDR_Range
  virtualNetworkName       = var.virtualNetworkName
  defaultSubnetCIDR_Range  = var.defaultSubnetCIDR_Range
  depends_on               = [module.resource_group]
}

module "azure_userassignet_identities" {
  source                   = "./UserAssignedIdentities"
  resource_group_name      = var.resource_group_name
  infraLocation            = var.infraLocation
  UserAssignedIdentityName = var.UserAssignedIdentityName
  depends_on               = [module.azure_cluster_networking]
}

module "azure_cluster_k8s" {
  source                              = "./Cluster"
  aks_service_principal_app_id        = var.aks_service_principal_app_id
  aks_service_principal_client_secret = var.aks_service_principal_client_secret
  aks_service_principal_tenant_id     = var.aks_service_principal_tenant_id
  cluster_name                        = var.cluster_name
  dns_prefix                          = var.dns_prefix
  kubernetes_version                  = var.kubernetes_version
  infraLocation                       = var.infraLocation
  resource_group_name                 = var.resource_group_name
  nodepool_os_disk_size               = var.nodepool_os_disk_size
  vm_size                             = var.vm_size
  systemnpcount                       = var.systemnpcount
  systemnpname                        = var.systemnpname
  defaultNodepool_Subnet_id           = module.azure_cluster_networking.defaultNodepool_Subnet_id[0]
  depends_on                          = [module.azure_userassignet_identities]
}

module "azure_container_registry" {
  source              = "./ContainerRegistry"
  acr_name            = var.acr_name
  locationk8s         = var.infraLocation
  resource_group_name = var.resource_group_name
  depends_on          = [module.resource_group]
}
