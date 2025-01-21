resource "azurerm_user_assigned_identity" "UserAssignedIdentities" {
  location            = var.infraLocation
  name                = var.UserAssignedIdentityName
  resource_group_name = var.resource_group_name
}
