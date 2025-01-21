terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = var.infraLocation
    storage_account_name = var.backend_storage_account
    container_name       = var.backend_container
    key                  = var.backend_key
    use_msi              = true
    use_azuread_auth     = true
    client_id            = var.backend_client_id
    subscription_id      = var.backend_subscription_id
    tenant_id            = var.backend_tenant_id
  }
}

provider "azurerm" {
  features {}

  subscription_id     = var.aks_service_subscription_id
  tenant_id           = var.aks_service_principal_tenant_id
  client_id           = var.backend_client_id
  storage_use_azuread = true
  use_msi             = true
}
