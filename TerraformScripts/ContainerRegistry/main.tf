resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.locationk8s
  sku                 = "Standard"
  admin_enabled       = "true"
}
