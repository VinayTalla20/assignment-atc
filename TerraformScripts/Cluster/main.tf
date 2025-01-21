resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  location            = var.infraLocation
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  role_based_access_control_enabled = true

  azure_active_directory_role_based_access_control {
    tenant_id          = var.aks_service_principal_tenant_id
    azure_rbac_enabled = true
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"

  }

  default_node_pool {
    name                 = var.systemnpname
    node_count           = var.systemnpcount
    zones                = [1, 2, 3]
    vm_size              = var.vm_size
    os_disk_size_gb      = var.nodepool_os_disk_size
    vnet_subnet_id       = var.defaultNodepool_Subnet_id
    orchestrator_version = var.kubernetes_version
  }


  service_principal {
    client_id     = var.aks_service_principal_app_id
    client_secret = var.aks_service_principal_client_secret
  }

}
